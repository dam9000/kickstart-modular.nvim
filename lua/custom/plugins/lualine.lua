-- [[ Configure status line ]]
-- See `:help lualine`

return {
  'nvim-lualine/lualine.nvim',
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
