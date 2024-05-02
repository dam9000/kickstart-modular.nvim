return {
   {
      'navarasu/onedark.nvim', -- https://github.com/navarasu/onedark.nvim
      config = function()
         require('onedark').setup({
            style = 'warmer',
            transparent = true,
            toggle_style_key = '\\s',
            toggle_style_list = { 'warmer', 'darker', 'light' },
         })
         require('onedark').load()
      end,
   },
   -- {
   --    'rose-pine/neovim',
   --    name = 'rose-pine',
   --    config = function()
   --       require('rose-pine').setup({
   --          variant = 'main',
   --          dark_variant = 'main',
   --          dim_inactive_windows = false,
   --          styles = {
   --             transparency = true,
   --          },
   --       })
   --       local theme = require('lualine.themes.rose-pine')
   --       local modes = { 'normal', 'insert', 'visual', 'replace', 'command', 'inactive' }
   --       for _, mode in ipairs(modes) do
   --          theme[mode].c.bg = 'NONE'
   --       end
   --
   --       require('lualine').setup({
   --          options = {
   --             theme = theme,
   --          },
   --       })
   --       vim.cmd('colorscheme rose-pine')
   --    end,
   -- },
}
