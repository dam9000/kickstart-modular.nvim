return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      harpoon:setup {}

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Harpoon: Append current file' })
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Harpoon: Show mark list' })

      -- Only gigachads use Dvorak (TODO: Try Dvorak or Colemak)
      vim.keymap.set('n', '<C-a>', function()
        harpoon:list():select(1)
      end, { desc = 'Harpoon: Jump to mark 1' })
      vim.keymap.set('n', '<C-s>', function()
        harpoon:list():select(2)
      end, { desc = 'Harpoon: Jump to mark 2' })
      vim.keymap.set('n', '<C-d>', function()
        harpoon:list():select(3)
      end, { desc = 'Harpoon: Jump to mark 3' })
      vim.keymap.set('n', '<C-f>', function()
        harpoon:list():select(4)
      end, { desc = 'Harpoon: Jump to mark 4' })
    end,
  },
}
