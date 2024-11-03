-- [[ Configuration for color highlighter ]]

return {
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({
        css = { rgb_fn = true },
        html = { names = false },
        'javascript',
        'lua',
        'typescript',
        'yaml',
      }, {
        mode = 'background',
      })
    end,
  },
}
