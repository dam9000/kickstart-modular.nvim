return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup()

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Harpoon: [A]dd file to list' })
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon: Toggl[e] quick menu' })

    -- NOTE: Disabled due to unused yet
    -- vim.keymap.set('n', '<C-h>', function() harpoon:list():select(1) end, { desc = 'Harpoon: Go to mark 1' })
    -- vim.keymap.set('n', '<C-t>', function() harpoon:list():select(2) end, { desc = 'Harpoon: Go to mark 2' })
    -- vim.keymap.set('n', '<C-n>', function() harpoon:list():select(3) end, { desc = 'Harpoon: Go to mark 3' })
    -- vim.keymap.set('n', '<C-s>', function() harpoon:list():select(4) end, { desc = 'Harpoon: Go to mark 4' })

    -- Toggle previous & next buffers stored within Harpoon list
    -- NOTE: Disabled due to conflicts with windows terminal keybinds
    -- vim.keymap.set('n', '<C-S-P>', function() harpoon:list():prev() end
    -- vim.keymap.set('n', '<C-S-N>', function() harpoon:list():next() end)
  end,
}
