-- [[ Adds indentation guides even on blank lines ]]
-- See `:help ibl`

return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      local highlight = {
        'RainbowIndentRed',
        'RainbowIndentYellow',
        'RainbowIndentBlue',
        'RainbowIndentPurple',
        'RainbowIndentOrange',
        'RainbowIndentCyan',
      }
      local hooks = require 'ibl.hooks'

      -- NOTE: Update the hex colors to match the selected colorscheme.
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, 'RainbowIndentRed', { fg = '#f7768e' })
        vim.api.nvim_set_hl(0, 'RainbowIndentYellow', { fg = '#e0af68' })
        vim.api.nvim_set_hl(0, 'RainbowIndentBlue', { fg = '#7aa2f7' })
        vim.api.nvim_set_hl(0, 'RainbowIndentPurple', { fg = '#bb9af7' })
        vim.api.nvim_set_hl(0, 'RainbowIndentOrange', { fg = '#ff9e64' })
        vim.api.nvim_set_hl(0, 'RainbowIndentCyan', { fg = '#7dcfff' })
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
