return {
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
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace (project).
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        end,
      })

      require('mason').setup()
      require('mason-lspconfig').setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name)
          local capabilities = require('cmp_nvim_lsp').default_capabilities()
          require('lspconfig')[server_name].setup { capabilities = capabilities }
        end,

        -- Every entry is a custom lsp config
        -- [[
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

            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' },
                },
              },
            },

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
        -- ]]
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
