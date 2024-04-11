return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        variant = 'auto',
        dark_variant = 'main',
        dim_inactive_windows = false,
        styles = {
          transparency = true,
        },
      }
      vim.cmd 'colorscheme rose-pine'
    end,
  },
}
