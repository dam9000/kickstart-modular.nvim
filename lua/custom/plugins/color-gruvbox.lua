return {
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    opts = {
      contrast = 'soft',
    },
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      --      vim.cmd.colorscheme 'gruvbox-material'
      -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
    end,
  },
}
