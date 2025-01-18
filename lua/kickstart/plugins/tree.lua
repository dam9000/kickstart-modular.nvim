-- [[ Configure File Explorer / Tree ]]

return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    actions = {
      open_file = {
        window_picker = { enable = false },
      },
    },
    view = {
      preserve_window_proportions = true,
      width = 40,
    },
    filters = {
      git_ignored = false,
    },
  },
  config = function(_, opts)
    -- Recommended settings to disable default netrw file explorer
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Keymaps
    vim.keymap.set('n', '<leader>eo', ':NvimTreeOpen<CR>', { desc = '[O]pen File Explorer' })
    vim.keymap.set('n', '<leader>ec', ':NvimTreeClose<CR>', { desc = '[C]lose File Explorer' })
    vim.keymap.set('n', '<leader>ee', ':NvimTreeToggle<CR>', { desc = 'Toggl[e] File Explorer' })
    vim.keymap.set('n', '<leader>ef', ':NvimTreeFocus<CR>', { desc = '[F]ocus File Explorer' })

    -- NOTE: Use `g?` to see all available keymaps
    require('nvim-tree').setup(opts)
  end,
}

-- vim: ts=2 sts=2 sw=2 et
