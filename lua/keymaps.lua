-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- My Overrides

-- Move Line(s)
vim.keymap.set("n", "<a-k>", ":m .-2<CR>==", { desc = 'Move Line up' })
vim.keymap.set("n", "<a-j>", ":m .+1<CR>==", { desc = 'Move Line down' })

vim.keymap.set("v", "<a-k>", ":m '<-2<CR>gv=gv", { desc = 'Move Line(s) up' })
vim.keymap.set("v", "<a-j>", ":m '>+1<CR>gv=gv", { desc = 'Move Line(s) down' })

vim.keymap.set("i", "<a-k>", "<Esc>:m .-2<CR>==gi", { desc = 'Move Line(s) up' })
vim.keymap.set("i", "<a-j>", "<Esc>:m .+1<CR>==gi", { desc = 'Move Line(s) down' })

-- Join lines
vim.keymap.set("n", "J", "mzJ`z", { desc = 'Move Line(s) down' })

-- Code Folding
vim.o.foldmethod = "indent"
vim.opt.foldlevel = 20
vim.keymap.set('n', '<leader>a', 'za', { desc = 'Fold Toggle' })
vim.keymap.set('n', '<leader>k', 'za', { desc = 'Fold Toggle' })

-- Close Buffers
vim.keymap.set('n', '<S-x>', ':bd<CR>', { desc = 'Close Buffer' })

-- use jj & jk to exit insert mode
vim.keymap.set('i', 'jj', '<ESC>', { desc = 'Exit Insert Mode' })
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Exit Insert Mode' })

-- Splits
vim.keymap.set('n', '<leader>|', ':vsplit<CR>', { desc = 'Vertical split' })
vim.keymap.set('n', '<leader>_', ':split<CR>', { desc = 'Horizontal split' })

-- Save
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file.' })

-- Page Up/Down
vim.keymap.set('n', '<C-p>', '<C-u>zz', { desc = 'Half Page Up.' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half Page Down.' })

vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Page Up.' })
vim.keymap.set('n', '<C-n>', '<C-d>zz', { desc = 'Page Down.' })

-- Keep search in the middle of the screen.
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Page Up.' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Page Up.' })

-- Delete char without copying it to clipboard
vim.keymap.set('n', 'x', '"_x', { desc = 'Delete character.' })

-- Remap Q to Close without saving.
vim.keymap.set('n', 'Q', ':q!<CR>', { desc = 'Close without saving.' })

-- Neo Tree
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Open File Explorer' })

-- Yank to System clipboard
vim.keymap.set('n', '<leader>y', "\"+y", { desc = 'Copy to Clipbord.' })
vim.keymap.set('v', '<leader>y', "\"+y", { desc = 'Copy to Clipbord.' })
vim.keymap.set('n', '<leader>Y', "\"+Y", { desc = 'Copy to Clipbord.' })

-- Replace with word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- vim: ts=2 sts=2 sw=2 et
