local map = vim.keymap.set

-- Basic
map('i', '<C-c>', '<Esc>')
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<leader>pl', '<cmd>Explore<CR>')

-- Markdown preview
map('n', '<leader>mp', '<cmd>MarkdownPreviewToggle<CR>')

-- Indent blankline
map('n', '<leader>ibl', '<cmd>IBLToggle<CR>')

-- Telescope colorscheme
map('n', '<leader>cs', '<cmd>Telescope colorscheme<CR>')

-- nabla
map('n', '<leader>pp', '<cmd>lua require"nabla".popup()<CR>')

-- diagnostics
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Window movement
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Comments
map('n', '<leader>/', 'gcc', { desc = 'Toggle Comment', remap = true })
map('v', '<leader>/', 'gc', { desc = 'Toggle comment', remap = true })

-- Yanking and highlighting
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
