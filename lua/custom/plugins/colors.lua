return {
  {
    { 'rose-pine/neovim', name = 'rose-pine' },
  },

  {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup {
        style = 'darker', -- dark, darker, cool, deep, warm, warmer
      }

      -- vim.cmd.colorscheme 'onedark'
    end,
  },

  {
    'mstcl/ivory',
    lazy = false,
    config = function()
      -- vim.cmd.colorscheme 'ivory'
      -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
    end,
  },

  {
    'ribru17/bamboo.nvim',
    lazy = false,
    config = function()
      require('bamboo').setup {
        style = 'vulgaris', -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
        transparent = false, -- Show/hide background
      }

      -- vim.cmd 'colorscheme bamboo'
    end,
  },

  {
    'ptdewey/darkearth-nvim',
    config = function()
      -- vim.cmd.colorscheme 'darkearth'
      -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
    end,
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
      -- vim.cmd.colorscheme 'gruvbox-material'
      -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
    end,
  },

  {
    'rebelot/kanagawa.nvim',
    config = function()
      -- setup must be called before loading
      -- vim.cmd 'colorscheme kanagawa-dragon'
      --    vim.cmd 'colorscheme kanagawa-lotus'
      -- vim.cmd 'colorscheme kanagawa-wave'
      --
      -- vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
    end,
  },

  {
    'slugbyte/lackluster.nvim',
    lazy = false,
    config = function()
      -- vim.cmd.colorscheme 'lackluster'
      -- vim.cmd.colorscheme 'lackluster-hack' -- my favorite
      -- vim.cmd.colorscheme 'lackluster-mint'
      -- vim.cmd.colorscheme 'lackluster-night'
      -- vim.cmd.colorscheme 'lackluster-dark'

      -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
    end,
  },

  {
    'e-q/okcolors.nvim',
    config = function()
      -- vim.cmd 'colorscheme okcolors'
      -- vim.cmd 'colorscheme okcolors-smooth'
      -- vim.cmd("colorscheme okcolors-sharp")
    end,
  },

  {
    'zenbones-theme/zenbones.nvim',
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    opts = {},
    config = function()
      -- vim.cmd 'colorscheme zenbones'
      -- vim.cmd 'colorscheme zenwritten'
      -- vim.cmd 'colorscheme neobones'
      -- vim.cmd 'colorscheme vimbones'
      -- vim.cmd 'colorscheme rosebones'
      -- vim.cmd 'colorscheme forestbones'
      -- vim.cmd 'colorscheme nordbones'
      -- vim.cmd 'colorscheme tokyobones'
      -- vim.cmd 'colorscheme seoulbones'
      -- vim.cmd 'colorscheme duckbones'
      -- vim.cmd 'colorscheme zenburned'
      -- vim.cmd 'colorscheme kanagawabones'
      -- vim.cmd 'colorscheme randombones'

      -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
    end,
  },
}
