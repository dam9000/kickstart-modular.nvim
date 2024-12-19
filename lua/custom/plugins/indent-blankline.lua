return {
  { -- Lines for indentation, with highlight for current indentation level.
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = { scope = { enabled = true, show_start = true, priority = 500 } },
  },
}
