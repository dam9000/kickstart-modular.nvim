-- Default landing page for custom plugins
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
      ['g.'] = 'actions.toggle_hidden',
    },
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
      -- This function defines what is considered a "hidden" file
      is_hidden_file = function(name, bufnr)
        return vim.startswith(name, '.')
      end,
      -- This function defines what will never be shown, even when `show_hidden` is set
      is_always_hidden = function(name, bufnr)
        return false
      end,
      -- Sort file names in a more intuitive order for humans. Is less performant,
      -- so you may want to set to false if you work with large directories.
      natural_order = false,
      sort = {
        -- sort order can be "asc" or "desc"
        -- see :help oil-columns to see which columns are sortable
        { 'type', 'asc' },
        { 'name', 'asc' },
      },
    },
  },
  {
    -- a simple buffer manager to avoid bn, bp
    'j-morano/buffer_manager.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
