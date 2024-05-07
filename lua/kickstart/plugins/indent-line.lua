-- [[ Adds indentation guides even on blank lines ]]
-- See `:help ibl`

return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      local highlight = {
        'RainbowPurple',
        'RainbowYellow',
        'RainbowBlue',
        'RainbowGreen',
        'RainbowCyan',
      }
      local hooks = require 'ibl.hooks'

      -- Create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes.
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, 'RainbowPurple', { fg = '#c099ff' })
        vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#ffc777' })
        vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#82aaff' })
        vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#c3e88d' })
        vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#86e1fc' })
      end)

      -- Initialize the plugin with the custom configuration.
      require('ibl').setup {
        indent = {
          highlight = highlight,
          char = '│',
        },
        scope = {
          enabled = false,
          char = '┃',
        },
      }
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
