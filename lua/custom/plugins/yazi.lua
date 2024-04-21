return {
   'mikavilpas/yazi.nvim',
   dependencies = {
      'nvim-lua/plenary.nvim',
   },
   event = 'VeryLazy',
   keys = {
      {
         -- 👇 choose your own keymapping
         '\\y',
         function()
            require('yazi').yazi()
         end,
         { desc = 'Open [Y]azi file manager' },
      },
   },
   opts = {
      open_for_directories = false,
   },
}
