return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>ha',
      function()
        require('harpoon'):list():add()
      end,
      desc = '[H]arpoon [A]dd file',
    },
    {
      '<leader>hh',
      function()
        local harpoon = require 'harpoon'
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = '[H]arpoon menu',
    },
    {
      '<leader>1',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = 'Harpoon file 1',
    },
    {
      '<leader>2',
      function()
        require('harpoon'):list():select(2)
      end,
      desc = 'Harpoon file 2',
    },
    {
      '<leader>3',
      function()
        require('harpoon'):list():select(3)
      end,
      desc = 'Harpoon file 3',
    },
    {
      '<leader>4',
      function()
        require('harpoon'):list():select(4)
      end,
      desc = 'Harpoon file 4',
    },
  },
  config = function()
    require('harpoon'):setup()
  end,
}
