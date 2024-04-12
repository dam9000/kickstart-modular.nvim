return {
  {
    -- neoscroll.nvim
    -- make large scrolling actions smoother
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup {}
    end,
  },
}
