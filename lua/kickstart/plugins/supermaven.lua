return {
  'supermaven-inc/supermaven-nvim',
  event = 'VeryLazy',
  config = function()
    require('supermaven-nvim').setup {
      keymaps = {
        accept_suggestion = '<A-f>',
        accept_word = '<A-w>',
        clear_suggestion = '<A-c>',
      },
    }
  end,
}
