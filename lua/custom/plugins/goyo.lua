return {
   'junegunn/goyo.vim',
   config = function()
      vim.g.goyo_width = 100
   end,
   vim.keymap.set('n', '\\z', '<cmd>Goyo<cr>', { desc = '[Z]en mode' }),
}
