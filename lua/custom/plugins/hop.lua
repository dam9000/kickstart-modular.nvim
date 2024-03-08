-- [[ Configure easy motions for Neovim ]]

vim.keymap.set('n', '<leader>h', ':HopPattern<CR>', { silent = true })

return {
  'smoka7/hop.nvim',
  version = '2.5.1',
  opts = {},
}
