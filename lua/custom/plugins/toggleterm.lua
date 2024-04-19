return {
   {
      'akinsho/toggleterm.nvim',
      version = '*',
      config = true,
      opts = {
         size = 20,
         float_opts = {
            border = 'curved',
            width = 100,
            height = 30,
            title_pos = 'left',
         },
      },
   },

   vim.keymap.set('n', '<A-i>', '<cmd>ToggleTerm direction=horizontal<cr>', { desc = 'Toggle a split terminal' }),
   vim.keymap.set('n', '<A-f>', '<cmd>ToggleTerm direction=float<cr>', { desc = 'Toggle a floating terminal' }),
}
