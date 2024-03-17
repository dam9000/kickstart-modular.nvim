return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = function()
    return require 'custom.plugins.configs.nvimtree'
  end,
  config = function(_, opts)
    require('nvim-tree').setup(opts)
  end,
}
