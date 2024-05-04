-- temporary solution to copying to buffer
return {
  'princejoogie/dir-telescope.nvim',
  -- telescope.nvim is a required dependency
  requires = { 'nvim-telescope/telescope.nvim' },
  config = function()
    require('dir-telescope').setup {
      -- these are the default options set
      hidden = true,
      no_ignore = false,
      show_preview = true,
    }

    -- this works
    vim.keymap.set('n', '<leader>fd', '<cmd>Telescope dir live_grep<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>pd', '<cmd>Telescope dir find_files<CR>', { noremap = true, silent = true })
  end,
}
