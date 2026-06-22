-- Oil.nvim is a Neovim plugin to edit your filesystem like a buffer
-- https://github.com/stevearc/oil.nvim

vim.pack.add {
  { src = 'https://github.com/stevearc/oil.nvim', version = vim.version.range '*' },
}

require('oil').setup()

-- Open the parent directory of the current file (vinegar-style)
vim.keymap.set('n', '-', '<Cmd>Oil<CR>', { desc = 'Open parent directory (Oil)' })
