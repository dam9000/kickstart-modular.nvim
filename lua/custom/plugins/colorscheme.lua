--[[

Configure your editor color theme

NOTE: Uncomment section for whichever theme you prefer or add a new one.
If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.

--]]

-- TokyoNight Theme
return {
  'folke/tokyonight.nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  opts = {
    -- transparent = true,
    style = 'storm', -- available variations: "storm, night, moon, day"
  },
  config = function(_, opts)
    require('tokyonight').setup(opts)
    vim.cmd.colorscheme 'tokyonight'
  end,
}

-- Catppuccin Theme
-- return {
--   'catppuccin/nvim',
--   name = "catppuccin", -- name is needed otherwise plugin shows up as "nvim" due to github URI
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   opts = {
--     -- Replace this with your scheme-specific settings or remove to use the defaults
--     -- transparent = true,
--     flavour = "mocha", -- available variations: "latte, frappe, macchiato, mocha"
--   },
--   config = function(_, opts)
--     require('catppuccin').setup(opts)
--     vim.cmd.colorscheme 'catppuccin'
--   end
-- }

-- Kanagawa Theme
-- return {
--   'rebelot/kanagawa.nvim',
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   opts = {
--     -- Replace this with your scheme-specific settings or remove to use the defaults
--     -- transparent = true,
--     background = {
--       -- light = "lotus",
--       dark = "wave", -- available variations: "wave, dragon"
--     },
--   },
--   config = function(_, opts)
--     require('kanagawa').setup(opts)
--     vim.cmd("colorscheme kanagawa")
--   end
-- }

-- Solarized Dark Theme
-- return {
--   'ishan9299/nvim-solarized-lua',
--   opts = {}
--   config = function(_, opts)
--     require('solarized').setup(opts)
--     vim.cmd.colorscheme 'solarized'
--   end,
-- }

-- vim: ts=2 sts=2 sw=2 et
