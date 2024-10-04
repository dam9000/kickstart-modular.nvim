return {
  {
    'lervag/vimtex',
    lazy = true, -- we don't want to lazy load VimTeX
    enabled = false,
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_viewer_method = 'SumatraPDF'
      vim.g.vimtex_compiler_method = 'latexrun'
    end,
  },
}
