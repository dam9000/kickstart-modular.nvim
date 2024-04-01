-- [[ Configure File Explorer / Tree ]]

vim.keymap.set('n', '<leader>to', ':NvimTreeOpen<CR>', { silent = true, desc = 'Open File Tree' })
vim.keymap.set('n', '<leader>tc', ':NvimTreeClose<CR>', { silent = true, desc = 'Close File Tree' })

return {
  'nvim-tree/nvim-tree.lua',

  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  opts = {
    actions = {
      open_file = {
        window_picker = {
          enable = false,
        },
      },
    },
  },

  config = function(_, opts)
    -- Recommended settings to disable default netrw file explorer
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require('nvim-tree').setup(opts)
  end,
}

-- vim: ts=2 sts=2 sw=2 et
