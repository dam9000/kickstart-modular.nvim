-- Throw all of my plugins whose configuration doesn't get too extensive here
-- See the kickstart.nvim README for more information

return {
  {
    -- oil.nvim
    'stevearc/oil.nvim',
    config = function()
      -- Initialize oil.nvim with default settings
      local oil = require 'oil'
      oil.setup()

      vim.keymap.set('n', '-', function()
        require('oil').toggle_float()
      end, { desc = 'Toggle oil in floating window' })
      -- Keymap for opening parent directory in oil.nvim
      -- vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
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

    {
      'theprimeagen/harpoon',
      branch = 'harpoon2',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('harpoon'):setup()
      end,
      keys = {
        {
          '<leader>A',
          function()
            require('harpoon'):list():append()
          end,
          desc = 'harpoon file',
        },
        {
          '<leader>a',
          function()
            local harpoon = require 'harpoon'
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = 'harpoon quick menu',
        },
        {
          '<leader>1',
          function()
            require('harpoon'):list():select(1)
          end,
          desc = 'harpoon to file 1',
        },
        {
          '<leader>2',
          function()
            require('harpoon'):list():select(2)
          end,
          desc = 'harpoon to file 2',
        },
        {
          '<leader>3',
          function()
            require('harpoon'):list():select(3)
          end,
          desc = 'harpoon to file 3',
        },
        {
          '<leader>4',
          function()
            require('harpoon'):list():select(4)
          end,
          desc = 'harpoon to file 4',
        },
        {
          '<leader>5',
          function()
            require('harpoon'):list():select(5)
          end,
          desc = 'harpoon to file 5',
        },
      },
    },

    --   config = function()
    --     local harpoon = require 'harpoon'
    --     harpoon:setup
    --     -- harpoon:setup {
    --     --   select = function(list_item, list, option)
    --     --     -- list.cmd(list_item.value)
    --     --     vim.cmd("echo hi")
    --     --   end,
    --     -- }
    --     --
    --
    --
    --     vim.keymap.set('n', '<leader>m', function()
    --       harpoon:list():add()
    --     end, { desc = 'Mark current buffer in Harpoon Menu' })
    --     vim.keymap.set('n', '<leader>h', function()
    --       harpoon.ui:toggle_quick_menu(harpoon:list())
    --     end, { desc = 'Toggle Harpoon Menu' })
    --
    --     vim.keymap.set('n', '<leader>1>', function()
    --       harpoon:list():select(1)
    --     end, { desc = 'this is supposed to do something ... ' })
    --     vim.keymap.set('n', '<leader>2>', function()
    --       harpoon:list():select(2)
    --     end)
    --     vim.keymap.set('n', '<leader>3>', function()
    --       harpoon:list():select(3)
    --     end)
    --     vim.keymap.set('n', '<leader>4>', function()
    --       harpoon:list():select(4)
    --     end)
    --
    --     -- Toggle previous & next buffers stored within Harpoon list
    --     vim.keymap.set('n', '<C-S-P>', function()
    --       harpoon:list():prev()
    --     end)
    --     vim.keymap.set('n', '<C-S-N>', function()
    --       harpoon:list():next()
    --     end)
    --   end,
  },
}
