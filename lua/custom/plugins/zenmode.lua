return {
   'folke/zen-mode.nvim',
   config = function()
      vim.keymap.set('n', '\\z', function()
         require('zen-mode').setup({
            window = {
               width = 100,
               options = {},
            },
         })
         require('zen-mode').toggle()
         vim.wo.wrap = false
         vim.wo.number = true
         vim.wo.rnu = true
      end, { desc = 'Toggle [Z]en mode', noremap = true, silent = true })
   end,
}
