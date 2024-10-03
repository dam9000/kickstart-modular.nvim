local map = vim.keymap.set

map('i', '<C-c>', '<Esc>')
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<leader>pl', '<cmd>Explore<CR>')
map('n', '<leader>mp', '<cmd>MarkdownPreviewToggle<CR>')
map('n', '<leader>ibl', '<cmd>IBLToggle<CR>')
map('n', '<leader>cs', '<cmd>Telescope colorscheme<CR>')
map('n', '<leader>mf', '<cmd>lua MiniFiles.open()<CR>')

map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('n', '<leader>/', 'gcc', { desc = 'Toggle Comment', remap = true })
map('v', '<leader>/', 'gc', { desc = 'Toggle comment', remap = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
