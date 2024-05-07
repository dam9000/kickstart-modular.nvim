-- [[ Configure easy motions for Neovim ]]

return {
  'smoka7/hop.nvim',
  version = '2.5.1',
  opts = {},
  config = function(_, opts)
    -- Keymaps
    vim.keymap.set('n', '<leader>jp', ':HopPattern<CR>', { desc = '[J]ump to [P]attern' })

    require('hop').setup(opts)
  end,
}

-- vim: ts=2 sts=2 sw=2 et
