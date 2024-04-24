-- Highlight todo, notes, etc in comments
return {
   {
      'folke/todo-comments.nvim',
      event = 'VimEnter',
      dependencies = {
         'nvim-lua/plenary.nvim',
      },
      opts = {
         signs = false,
      },
   },
   vim.keymap.set('n', '\\t', '<cmd>TodoQuickFix<cr>', { desc = '[T]odo Quickfix', noremap = true, silent = true }),
}
