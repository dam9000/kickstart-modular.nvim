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

        -- Enable italics comments
        italic_comments = false,

        -- Set terminal colors used in `:terminal`
        terminal_colors = true,

        -- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
        cache = true,

        -- Override a highlight group entirely using the built-in colour palette
        overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
          -- Example:
          return {
            -- Comment = { fg = colors.green },
            -- ['@property'] = { fg = colors.magenta, bold = true },
            Keyword = { fg = colors.pink },
            Number = { fg = colors.purple },
            Operator = { fg = colors.fg },
            Special = { fg = colors.fg },
            Function = { fg = colors.yellow },
            Boolean = { fg = colors.pink },
            Identifier = { fg = colors.blue },
          }
        end,

        colors = {
          dark = {
            bg_highlight = '#373737',
            fg = '#E5E5E5',
            grey = '#828282',
            blue = '#48CBFF',
            cyan = '#67F0E7',
            green = '#80EE6A',
            red = '#FF2727',
            yellow = '#FFD059',
            magenta = '#D575D6',
            orange = '#F67400',
            pink = '#FF6BA8',
            purple = '#A368E4',
          },
        },
      }

      vim.cmd.colorscheme 'cyberdream'
    end,
  },
}
