return {
  {
    'lervag/vimtex',
    lazy = true, -- we don't want to lazy load VimTeX
    enabled = false,
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'zathura'
    end,
  },
}
