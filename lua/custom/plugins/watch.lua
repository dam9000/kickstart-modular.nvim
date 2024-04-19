return {
   'Makaze/watch.nvim',
   cmd = { 'WatchStart', 'WatchStop', 'WatchFile' },
   config = function()
      require('watch').setup({
         close_on_stop = true,
         split = {
            enabled = true,
            size = 10,
         },
      })
   end,
   vim.keymap.set('n', '\\w', function()
      local i = require('watch.input')
      local watch = require('watch')
      watch.start(i.get_input('Command: '))
   end, { desc = '[W]atch a command' }),

   vim.keymap.set('n', '\\W', '<cmd>WatchStop<cr>', { desc = 'Stop [W]atching' }),
}
