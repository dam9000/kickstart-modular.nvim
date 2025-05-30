return {
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('cyberdream').setup {
        -- Set light or dark variant
        variant = 'default', -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
        -- Enable transparent background
        transparent = true,

        -- Reduce the overall saturation of colours for a more muted look
        saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)

        -- Override a highlight group entirely using the built-in colour palette
        overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
          -- Example:
          return {
            -- Comment = { fg = colors.green },
            -- ['@property'] = { fg = colors.magenta, bold = true },
            Keyword = { fg = colors.magenta },
            Operator = { fg = colors.fg },
            Special = { fg = colors.yellow },
          }
        end,

        -- Enable italics comments
        italic_comments = false,
        colors = {
          dark = {
            fg = '#E5E5E5',
            grey = '#767676',
            blue = '#3DAEE9',
            cyan = '#30EADF',
            red = '#FF2727',
            yellow = '#FFC73A',
            -- magenta = '#FF00FF',
            magenta = '#C97BD5',
            orange = '#F67400',
          },
        },
      }

      vim.cmd.colorscheme 'cyberdream'
    end,
  },
}
