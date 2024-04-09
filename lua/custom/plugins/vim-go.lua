return {
  {
    'fatih/vim-go',
  },

  vim.keymap.set('n', '<leader>gr', ':GoRun<cr>', { desc = 'Go: [R]un' }),
  vim.keymap.set('n', '<leader>gb', ':GoBuild<cr>', { desc = 'Go: [B]uild' }),
  vim.keymap.set('n', '<leader>ge', ':GoErrCheck<cr>', { desc = 'Go: [B]uild' }),
  vim.keymap.set('n', '<leader>gv', ':GoVet<cr>', { desc = 'Go: [B]uild' }),
  vim.keymap.set('n', '<leader>gt', ':GoTest<cr>', { desc = 'Go: Run [T]ests' }),
  vim.keymap.set('n', '<leader>gT', ':GoTestFunc<cr>', { desc = 'Go: Run this [T]est' }),
  vim.keymap.set('n', '<leader>gc', ':GoCoverage<cr>', { desc = 'Go: Test [C]overage' }),
}
