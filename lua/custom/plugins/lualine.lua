return {
   'nvim-lualine/lualine.nvim',
   dependencies = { 'nvim-tree/nvim-web-devicons' },
   config = function()
      require('lualine').setup({
         options = {
            icons_enabled = true,
            section_separators = '',
            component_separators = '',
            disabled_filetypes = {
               'neo-tree',
            },
            extensions = {
               'lazy',
               'quickfix',
               'toggleterm',
               'mason',
            },
         },
         sections = {
            lualine_x = {
               {
                  require('noice').api.statusline.mode.get,
                  cond = require('noice').api.statusline.mode.has,
                  color = { fg = '#ff9e64' },
               },
            },
            lualine_a = {
               {
                  'buffers',
               },
            },
         },
      })
   end,
}
