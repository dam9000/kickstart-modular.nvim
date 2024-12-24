return {
  'stevearc/dressing.nvim',
  opts = {},
  config = function()
    require('dressing').setup {
      select = {
        backend = { 'telescope', 'builtin' },
      },
    }
  end,
}
