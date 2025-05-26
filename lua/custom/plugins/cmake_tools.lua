vim.keymap.set('n', '<leader>cb', ':CMakeBuild<CR>')
vim.keymap.set('n', '<leader>cc', ':CMakeRun<CR>')

return {
  'Civitasv/cmake-tools.nvim',
  opts = {},
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}
