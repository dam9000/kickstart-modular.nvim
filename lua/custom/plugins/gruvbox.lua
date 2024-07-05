return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      vim.o.background = 'dark' -- or "light" for light version
      vim.cmd [[colorscheme gruvbox]]
    end,
  },
}
