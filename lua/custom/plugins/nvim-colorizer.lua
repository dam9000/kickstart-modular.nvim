return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    vim.o.termguicolors = true
    require('colorizer').setup()
  end
}
