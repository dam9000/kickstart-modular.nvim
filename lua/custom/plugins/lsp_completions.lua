return {
  -- NOTE: [[ SNIPPETS ]]
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'rafamadriz/friendly-snippets',
      -- Tu importamo snippets
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
        require('luasnip.loaders.from_lua').load { paths = { 'C:/Users/joene/AppData/Local/nvim/snippets' } }
      end,
    },
    config = function()
      require('luasnip').config.setup {
        store_selection_keys = '<Tab>',
      }
    end,
  },

  { 'saadparwaiz1/cmp_luasnip' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-nvim-lua' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      luasnip.config.setup { enable_autosnippets = true }

      cmp.setup {
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        ---[==[
        mapping = cmp.mapping.preset.insert {
          -- suggestions
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<s-Tab>'] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm { select = false },

          -- snippet insert nodes
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
        },
        --]==]
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
          { name = 'nvim_lua' },
          { name = 'path' },
        }, {
          { name = 'buffer' },
        }),
      }

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
          { name = 'buffer' },
        }),
      })
      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })
      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          { name = 'cmdline' },
        }),
      })
    end,
  },

  -- NOTE: [[ LSP ]]
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      -- NOTE: from `kickstart/plugins/lspconfig.lua`
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          -- map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      require('mason').setup()
      require('mason-lspconfig').setup_handlers {
        -- These are the setups for specific LSP servers
        -- Default setup function
        function(server_name)
          local capabilities = require('cmp_nvim_lsp').default_capabilities()
          require('lspconfig')[server_name].setup { capabilities = capabilities }
        end,

        -- Every entry is a custom lsp config
        ['marksman'] = function()
          local capabilities = require('cmp_nvim_lsp').default_capabilities()
          local lspconfig = require 'lspconfig'

          lspconfig.clangd.setup {
            capabilities = capabilities,
          }
        end,

        ['clangd'] = function()
          local capabilities = require('cmp_nvim_lsp').default_capabilities()
          local lspconfig = require 'lspconfig'

          lspconfig.clangd.setup {
            capabilities = capabilities,
          }
        end,

        ['lua_ls'] = function()
          local capabilities = require('cmp_nvim_lsp').default_capabilities()
          local lspconfig = require 'lspconfig'

          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            on_init = function(client)
              local path = client.workspace_folders[1].name
              if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                  Lua = {
                    runtime = {
                      version = 'LuaJIT',
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                      checkThirdParty = false,
                      library = {
                        vim.env.VIMRUNTIME,
                      },
                    },
                  },
                })
                client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
              end
              return true
            end,
          }
        end,

        ['texlab'] = function()
          local capabilities = require('cmp_nvim_lsp').default_capabilities()
          local lspconfig = require 'lspconfig'
          lspconfig.texlab.setup {
            capabilities = capabilities,
            filetypes = { 'tex', 'bib', 'rnoweb' },
          }
        end,

        ['r_language_server'] = function()
          local capabilities = require('cmp_nvim_lsp').default_capabilities()
          local lspconfig = require 'lspconfig'

          lspconfig.r_language_server.setup {
            capabilities = capabilities,
            settings = {
              r = {
                lsp = {
                  rich_documentation = true,
                  diagnostics = true,
                },
              },
            },
            on_attach = function(client, bufnr)
              vim.diagnostic.config {
                virtual_text = false, -- Virtual text (the inline hints)
                signs = true, -- Show signs in the gutter
                underline = false, -- Underline problematic code
              }
            end,
          }
        end,
      }
    end,
  },
}
