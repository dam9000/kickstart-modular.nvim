return {
   {
      'Exafunction/codeium.vim',
      event = 'BufEnter',
   },

   vim.keymap.set('n', '\\a', '<cmd>call codeium#Chat()<cr>', { desc = '[A]i Chat', noremap = true, silent = true }),
}
