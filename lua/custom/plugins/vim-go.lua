return {
  {
    'fatih/vim-go',
  },

  vim.keymap.set('n', '<leader>gr', ':GoRun<cr>', { desc = '[R]un' }),
  vim.keymap.set('n', '<leader>gb', ':GoBuild<cr>', { desc = '[B]uild' }),
  vim.keymap.set('n', '<leader>ge', ':GoErrCheck<cr>', { desc = '[E]error check' }),
  vim.keymap.set('n', '<leader>gv', ':GoVet<cr>', { desc = '[V]et analysis' }),
  vim.keymap.set('n', '<leader>gt', ':GoTest<cr>', { desc = 'Run [T]ests' }),
  vim.keymap.set('n', '<leader>gT', ':GoTestFunc<cr>', { desc = 'Run this [T]est' }),
  vim.keymap.set('n', '<leader>gc', ':GoCoverage<cr>', { desc = 'Test [C]overage' }),
}
