return {
  -- SNIPPETS
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

  -- Built-in LSP
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
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
                virtual_text = false, -- Disable virtual text (the inline hints)
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
