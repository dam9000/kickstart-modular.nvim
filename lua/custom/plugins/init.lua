-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    -- neoscroll.nvim
    -- make large scrolling actions smoother
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup {}
    end,
  },
  {
    -- oil.nvim
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup() -- Initialize oil.nvim with default settings
      -- Keymap for opening parent directory in oil.nvim
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    -- a simple buffer manager to avoid bn, bp
    'j-morano/buffer_manager.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    -- allows "harpoon'ing' into commonly used files,
    --  as opposed to :bn, :bp over files opened used to search
    --  rather than edit.
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      vim.keymap.set('n', '<leader>m', function()
        harpoon:list():add()
      end, { desc = 'Mark current buffer in Harpoon Menu' })
      vim.keymap.set('n', '<leader>h', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Toggle Harpoon Menu' })

      vim.keymap.set('n', '<leader>1>', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<leader>2>', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<leader>3>', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<leader>4>', function()
        harpoon:list():select(4)
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-S-P>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-S-N>', function()
        harpoon:list():next()
      end)
    end,
  },
}
