-- [[ Configure Autocompletion ]]

return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {
      -- Snippet Engine
      'L3MON4D3/LuaSnip',
      -- Build Step is needed for regex support in snippets.
      build = (function()
        -- Build step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
    },

    -- NOTE: nvim-cmp does not ship with all sources by default. They are split into multiple repos.
    'saadparwaiz1/cmp_luasnip', -- Source for luasnip snippets
    'hrsh7th/cmp-nvim-lsp', -- LSP completion capabilities
    'hrsh7th/cmp-path', -- Source for file system path completion
    'hrsh7th/cmp-buffer', -- Source for buffer words completion
  },
  config = function()
    -- See `:help cmp`
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup()

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },

      -- See `:help ins-completion` for more information.
      mapping = cmp.mapping.preset.insert {
        ['<C-j>'] = cmp.mapping.select_next_item(), -- Select the [n]ext item
        ['<C-k>'] = cmp.mapping.select_prev_item(), -- Select the [p]revious item
        ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Scroll the documentation window back
        ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Scroll the documentation window forward

        -- Accept the completion.
        -- This will auto-import if your LSP supports it.
        -- This will expand snippets if the LSP sent a snippet.
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },

        -- Manually trigger a completion from nvim-cmp.
        -- NOTE: Generally not needed, as nvim-cmp will display completions whenever they are available.
        ['<C-Space>'] = cmp.mapping.complete {},

        -- Move to the right of the snippet expansion locations.
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),

        -- Move to the left of the snippet expansion locations.
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'render-markdown' },
      },
    }
  end,
}

-- vim: ts=2 sts=2 sw=2 et
