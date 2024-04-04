return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require('neo-tree').setup {
        window = {
          mappings = {
            ['s'] = 'open_split',
            ['S'] = 'open_vsplit',
          },
        },
        filesystem = {
          filtered_items = {
            visible = true,
          },
          follow_current_file = {
            enabled = true,
          },
        },
      }
    end,
  },

  vim.keymap.set('n', '\\f', ':Neotree current filesystem<cr>', { desc = '[F]ile explorer' }),
  vim.keymap.set('n', '\\b', ':Neotree float buffers<cr>', { desc = 'List open [B]uffers' }),
  vim.keymap.set('n', '\\g', ':Neotree current git_status<cr>', { desc = 'Show [G]it status' }),
}
