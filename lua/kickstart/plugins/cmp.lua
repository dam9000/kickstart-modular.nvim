return {
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
    event = 'InsertEnter',
    dependencies = {
      'onsails/lspkind.nvim',
      'roobert/tailwindcss-colorizer-cmp.nvim',
    },
    config = function()
      local cmp = require 'cmp'
      local lspkind = require 'lspkind'
      local luasnip = require 'luasnip'

      luasnip.config.setup { enable_autosnippets = true }

      cmp.setup {
        performance = {
          max_view_entries = 30,
        },

        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },

        view = {
          entries = {
            name = 'custom', -- can be "custom", "wildmenu" or "native"
            selection_order = 'near_cursor',
          },
        },

        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },

        formatting = {
          format = lspkind.cmp_format {
            mode = 'text',
            maxwidth = 50,
          },
        },

        mapping = cmp.mapping.preset.insert {
          -- suggestions
          ['<CR>'] = cmp.mapping.confirm { select = false },

          ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,

          ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,

          -- documentation
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

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
}
