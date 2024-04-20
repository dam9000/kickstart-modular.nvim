return {
   'tamton-aquib/duck.nvim',
   config = function()
      vim.keymap.set('n', '<leader>dd', function()
         require('duck').hatch('🦀')
      end, { desc = 'Hatch a pet' })
      vim.keymap.set('n', '<leader>dk', function()
         require('duck').cook()
      end, { desc = 'Cook a pet' })
      vim.keymap.set('n', '<leader>da', function()
         require('duck').cook_all()
      end, { desc = 'Cook all pets' })
   end,
}
