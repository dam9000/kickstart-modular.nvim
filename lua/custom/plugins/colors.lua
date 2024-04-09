return {
  {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup {
        transparent = true,
        term_colors = true,
        style = 'darker',
      }
      require('onedark').load()
    end,
  },
}
