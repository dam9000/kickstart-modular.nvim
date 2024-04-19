return {
   {
      'fatih/vim-go',
   },

   vim.keymap.set('n', '<leader>gg', '<cmd>GoAlternate!<cr>', { desc = '[A]lternate code and test' }),
   vim.keymap.set('n', '<leader>gr', '<cmd>GoRun<cr>', { desc = '[R]un' }),
   vim.keymap.set('n', '<leader>gb', '<cmd>GoBuild<cr>', { desc = '[B]uild' }),
   vim.keymap.set('n', '<leader>gt', '<cmd>GoTest<cr>', { desc = 'Run [T]ests' }),
   vim.keymap.set('n', '<leader>gT', '<cmd>GoTestFunc<cr>', { desc = 'Run a single [T]est' }),
   vim.keymap.set('n', '<leader>gy', '<cmd>!go mod tidy<cr>', { desc = 'Tid[y] the go.mod file' }),
   vim.keymap.set('n', '<leader>gc', '<cmd>GoCoverageToggle<cr>', { desc = 'Test [C]overage' }),
   vim.keymap.set('n', '<leader>gv', '<cmd>GoVet<cr>', { desc = '[V]et Code' }),
   vim.keymap.set('n', '<leader>gm', '<cmd>GoMetaLinter<cr>', { desc = 'Run [M]eta Checks (does nothing)' }),
}
