-- [[ Configure rainbow brackets for Neovim ]]

return {
  'HiPhish/rainbow-delimiters.nvim',
  config = function()
    local rainbow = require 'rainbow-delimiters'
    require('rainbow-delimiters.setup').setup {
      strategy = {
        [''] = rainbow.strategy['global'],
        commonlisp = rainbow.strategy['local'],
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
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
      },
      blacklist = {'c', 'cpp'},
    }
  end,
}
