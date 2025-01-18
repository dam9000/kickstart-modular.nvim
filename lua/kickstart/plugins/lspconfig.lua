--[[

Configure Language Server Protocol (LSP)

What is LSP?
LSP is an acronym you've probably heard, but might not understand what it is.

LSP stands for Language Server Protocol. It's a protocol that helps editors
and language tooling communicate in a standardized fashion.

In general, you have a "server" which is some tool built to understand a particular
language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc). These Language Servers
(sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
processes that communicate with some "client" - in this case, Neovim!

LSP provides Neovim with features like:
  * Go to definition.
  * Find references.
  * Autocompletion.
  * Symbol Search.
  * and more!

Thus, Language Servers are external tools that must be installed separately from Neovim.
This is where `mason` and related plugins come into play.

If you're wondering about LSP vs Treesitter, you can check out the wonderfully
and elegantly composed help section, `:help lsp-vs-treesitter`.

--]]

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for neovim.
    -- WARN: Must be loaded before dependencies
    { 'williamboman/mason.nvim', config = true },

    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Useful status updates for LSP.
    { 'j-hui/fidget.nvim', opts = {} },

    -- Configures Lua LSP for your Neovim config, runtime and plugins.
    -- Used for completion, annotations and signatures of Neovim APIs.
    { 'folke/neodev.nvim', opts = {} },
  },

  --  This function gets run when opening a file an LSP attaches to the current buffer.
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),

      -- This function allows to define mappings more easily.
      -- It sets the mode, buffer and description for each keymap.
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
        end

        -- Jump to the definition of the word under your cursor.
        -- This is where a variable was first declared, or where a function is defined, etc.
        -- To jump back, press <C-T>.
        map('<leader>se', require('telescope.builtin').lsp_definitions, 'Search D[e]finitions')

        -- Find references for the word under your cursor.
        map('<leader>sr', require('telescope.builtin').lsp_references, 'Search [R]eferences')

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map('<leader>si', require('telescope.builtin').lsp_implementations, 'Search [I]mplementations')

        -- NOTE: Symbols are things like variables, functions, types, etc.
        --
        -- Jump to the declaration of the symbol under your cursor.
        map('<leader>gD', vim.lsp.buf.declaration, 'Goto [D]eclaration')

        -- Jump to the definition of the symbol under your cursor.
        map('<leader>gd', vim.lsp.buf.definition, 'Goto [D]efinition')

        -- Jump to the type definition of the word under your cursor.
        map('<leader>st', require('telescope.builtin').lsp_type_definitions, 'Search [T]ype definition')

        -- Fuzzy find all the symbols in your current document.
        map('<leader>sy', require('telescope.builtin').lsp_document_symbols, 'Search Document S[y]mbols')

        -- Fuzzy find all the symbols in your current workspace.
        -- Similar to document symbols, except searches over your whole project.
        map('<leader>sp', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Search Works[p]ace Symbols')

        --  WARN: Not all Language Servers support renaming across files.
        --
        -- Rename the variable under your cursor.
        map('<leader>lr', vim.lsp.buf.rename, '[R]ename all references')

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map('<leader>la', vim.lsp.buf.code_action, 'Execute a code [A]ction')

        -- Displays an information window about the symbol under the cursor.
        -- Using the keymap twice jumps the cursor into the information window.
        map('<leader>lh', vim.lsp.buf.hover, 'Display [H]over information')

        -- TODO: Never displays anything for me, consider removing it.
        --
        -- Displays signature information about the symbol under the cursor.
        map('<leader>ls', vim.lsp.buf.signature_help, 'Display [S]ignature information')

        -- Highlight references of the word under the cursor when a key isn't pressed for the specified `updatetime`.
        -- See `:help CursorHold` for more information.
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          -- When the cursor is moved, the highlights are cleared.
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    -- Create new capabilities with nvim-cmp, and then broadcast that to the LSP servers.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- Enable the following language servers.
    -- See `:help lspconfig-all` for a list of all the pre-configured LSPs.
    local servers = {
      pyright = {},
      yamlls = {},
      jsonls = {},
      marksman = {},
      terraformls = {},
      tflint = {},
      bufls = {},
      sqlls = {},
      dockerls = {},
      cssls = {},
      -- rust_analyzer = {},

      -- NOTE: You can add any additional override configuration inside a server's table. For example:
      -- * cmd: Override the default command used to start the server
      -- * filetypes: Override the default list of associated filetypes for the server
      -- * capabilities: Override fields in capabilities. Can be used to disable certain LSP features.
      -- * settings: Override the default settings passed when initializing the server.
      --
      lua_ls = {
        -- cmd = {...},
        -- filetypes = { ...},
        -- capabilities = {},
        settings = {
          Lua = {
            completion = { callSnippet = 'Replace' },
            runtime = { version = 'LuaJIT' },
            telemetry = { enable = false },
            diagnostics = {
              disable = { 'missing-fields' },
              globals = { 'vim' },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
            },
          },
        },
      },
    }
    require('mason').setup()

    -- You can add other tools here that you want Mason to install, so that they are available from within Neovim.
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
      'buf',
      'markdownlint',
      'luacheck',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }
    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed by the server configuration above.
          -- Useful when disabling certain features of an LSP.
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}

-- vim: ts=2 sts=2 sw=2 et
