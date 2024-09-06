return {
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
