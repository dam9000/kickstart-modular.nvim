return {
  {
    'ferdinandrau/lavish.nvim',
    priority = 1000,
    config = function()
      -- require('lavish').apply 'light'
      -- require('lavish').apply 'dark'
    end,
  },

  {
    { 'rose-pine/neovim', name = 'rose-pine' },
  },

  {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup {
        style = 'darker', -- dark, darker, cool, deep, warm, warmer
      }
    end,
  },

  {
    'mstcl/ivory',
    lazy = false,
    config = function() end,
  },

  {
    'ribru17/bamboo.nvim',
    lazy = false,
    config = function()
      require('bamboo').setup {
        style = 'vulgaris', -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
        transparent = false, -- Show/hide background
      }
    end,
  },

  {
    'ptdewey/darkearth-nvim',
    config = function() end,
  },

  {
    'sainnhe/gruvbox-material',
    lazy = false,
    opts = {
      contrast = 'soft',
    },
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
    end,
  },

  {
    'rebelot/kanagawa.nvim',
    config = function() end,
  },

  {
    'slugbyte/lackluster.nvim',
    lazy = false,
    config = function() end,
  },

  {
    'e-q/okcolors.nvim',
    config = function() end,
  },

  {
    'zenbones-theme/zenbones.nvim',
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    opts = {},
    config = function() end,
  },
}
