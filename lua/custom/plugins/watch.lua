return {
  'Makaze/watch.nvim',
  config = function()
    require('watch').setup {
      close_on_stop = true,
      split = {
        enabled = true,
        size = 10,
      },
    }
  end,
  cmd = { 'WatchStart', 'WatchStop', 'WatchFile' },
  vim.keymap.set('n', '\\w', '<cmd>WatchStart ', { desc = 'Start [W]atching a command' }),
  vim.keymap.set('n', '\\W', '<cmd>WatchStop<cr>', { desc = 'Stop [W]atching' }),
}
