-- [[ Configure easy motions for Neovim ]]

return {
  'smoka7/hop.nvim',
  version = '2.5.1',
  opts = {},
  config = function(_, opts)
    vim.keymap.set('n', '<leader>h', ':HopPattern<CR>', { silent = true })
    require('hop').setup(opts)
  end,
}

-- vim: ts=2 sts=2 sw=2 et
