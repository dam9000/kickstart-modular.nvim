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
    -- there are more available that I didn't check
    keymaps = {
      ['<C-s>'] = 'actions.select_vsplit',
      ['<C-h>'] = 'actions.select_split',
    },
  },
  {
    -- a simple buffer manager to avoid bn, bp
    'j-morano/buffer_manager.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
