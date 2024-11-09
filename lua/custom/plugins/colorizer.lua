-- [[ Configuration for color highlighter ]]

return {
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({
        css = { rgb_fn = true },
        'html',
        'javascript',
        'lua',
        'typescript',
        'yaml',
      }, {
        mode = 'background',
        names = false,
      })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
