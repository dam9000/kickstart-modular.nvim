-- [[ Configure status line ]]

return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = false,
      theme = 'tokyonight',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
