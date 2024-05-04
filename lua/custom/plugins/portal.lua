-- applies "portals" that provide visuals to jumplists, etc
return {
  'cbochs/portal.nvim',
  -- Optional dependencies
  dependencies = {
    'cbochs/grapple.nvim',
    -- 'ThePrimeagen/harpoon',
  },
  config = function()
    vim.keymap.set('n', '<leader>o', '<cmd>Portal jumplist backward<cr>', { desc = 'Jump backward in the jumplist' })
    vim.keymap.set('n', '<leader>i', '<cmd>Portal jumplist forward<cr>', { desc = 'Jump forward in the jumplist' })
  end,
}
