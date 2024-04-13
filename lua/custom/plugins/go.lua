return {
  {
    'fatih/vim-go',
  },

  vim.keymap.set('n', '<leader>gg', ':GoAlternate!<cr>', { desc = '[A]lternate code and test' }),
  vim.keymap.set('n', '<leader>gr', ':GoRun<cr>', { desc = '[R]un' }),
  vim.keymap.set('n', '<leader>gb', ':GoBuild<cr>', { desc = '[B]uild' }),
  vim.keymap.set('n', '<leader>gt', ':GoTest ./... -v<cr>', { desc = 'Run [T]ests' }),
  vim.keymap.set('n', '<leader>gT', ':!go mod tidy<cr>', { desc = '[T]idy the go mod file' }),
  vim.keymap.set('n', '<leader>gc', ':GoCoverageToggle<cr>', { desc = 'Test [C]overage' }),
  vim.keymap.set('n', '<leader>gm', ':GoMetaLinter<cr>', { desc = 'Run [M]eta Checks' }),
}
