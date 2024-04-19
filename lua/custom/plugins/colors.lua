return {
   {
      'rose-pine/neovim',
      name = 'rose-pine',
      config = function()
         require('rose-pine').setup({
            variant = 'auto',
            dark_variant = 'main',
            dim_inactive_windows = false,
            styles = {
               transparency = true,
            },
         })
         local theme = require('lualine.themes.rose-pine')
         local modes = { 'normal', 'insert', 'visual', 'replace', 'command', 'inactive' }
         for _, mode in ipairs(modes) do
            theme[mode].c.bg = 'NONE'
         end

         require('lualine').setup({
            options = {
               theme = theme,
            },
         })
         vim.cmd('colorscheme rose-pine')
      end,
   },
}
