return {
   {
      'akinsho/toggleterm.nvim',
      version = '*',
      config = true,
      opts = {
         size = 20,
         float_opts = {
            border = 'curved',
            width = 120,
            height = 40,
            title_pos = 'left',
         },
      },
   },

   vim.keymap.set('n', '<A-i>', '<cmd>ToggleTerm direction=horizontal<cr>', { desc = 'Toggle a split terminal' }),
   vim.keymap.set('n', '<A-f>', '<cmd>ToggleTerm direction=float<cr>', { desc = 'Toggle a floating terminal' }),
}
