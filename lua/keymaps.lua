-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Simple shortcuts
vim.keymap.set({ 'n', 'v' }, '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-l>', '<C-w>l', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-c>', '<C-w>c', { silent = true })
vim.keymap.set('n', '<C-s>', '<Cmd>update!<CR><Esc>', { silent = true })
vim.keymap.set('i', '<C-s>', '<C-O><Cmd>update!<CR><Esc>', { silent = true })
vim.keymap.set('v', '<C-s>', '<C-C><Cmd>update!<CR><Esc>', { silent = true })
vim.keymap.set({ 'n', 'v', 'i' }, '<C-Up>', '<Cmd>resize -5<CR>', { silent = true })
vim.keymap.set({ 'n', 'v', 'i' }, '<C-Down>', '<Cmd>resize +5<CR>', { silent = true })
vim.keymap.set({ 'n', 'v', 'i' }, '<C-Left>', '<Cmd>vertical resize -5<CR>', { silent = true })
vim.keymap.set({ 'n', 'v', 'i' }, '<C-Right>', '<Cmd>vertical resize +5<CR>', { silent = true })
vim.keymap.set({ 'n', 'v', 'i' }, '<C-q>', '<Cmd>bd!<CR>', { silent = true })
vim.keymap.set({ 'n', 'v', }, '<C-\\>', function() vim.fn.system("touch " .. vim.fn.expand("%")) end, { silent = true })
vim.keymap.set('n', '<Esc><Esc>', '<Cmd>nohlsearch<CR>', { silent = true })

local function store_buffer_name_to_x_clipboard()
  vim.cmd("echo expand('%:p')")
  vim.cmd("let @+ = join([expand('%:p'), line('.')], ':')")
end

-- Clipboard
vim.keymap.set({ 'n' }, '<C-y>', store_buffer_name_to_x_clipboard, { silent = true })
vim.keymap.set({ 'v' }, '<C-y>', '"+y', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Neotree
--vim.keymap.set('n', '<C-space>', '<Cmd>Neotree toggle<CR>')
vim.keymap.set({ 'n', 'v', 'i' }, '<C-space>', '<Cmd>Neotree reveal<CR>', { silent = true })

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

-- vim: ts=2 sts=2 sw=2 et
