-- [[ Configure rainbow brackets for Neovim ]]

return {
  'HiPhish/rainbow-delimiters.nvim',
  config = function()
    local rainbow = require 'rainbow-delimiters'

    vim.api.nvim_set_hl(0, 'RainbowDelimiterRed', { fg = '#f7768e' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterPurple', { fg = '#bb9af7' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterOrange', { fg = '#ff9e64' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterBlue', { fg = '#7aa2f7' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterYellow', { fg = '#e0af68' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterCyan', { fg = '#7dcfff' })

    require('rainbow-delimiters.setup').setup {
      strategy = {
        [''] = rainbow.strategy['global'],
        vim = rainbow.strategy['local'],
      },
      query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
      },
      priority = {
          [''] = 110,
          lua = 210,
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterPurple',
        'RainbowDelimiterOrange',
        'RainbowDelimiterCyan',
      },
      blacklist = {'c', 'cpp'},
    }
  end,
}

-- vim: ts=2 sts=2 sw=2 et
