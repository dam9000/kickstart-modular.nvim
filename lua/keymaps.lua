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

-- Emacs style in command line
vim.keymap.set('c', '<C-A>', '<Home>')
vim.keymap.set('c', '<C-D>', '<Del>')
vim.keymap.set('c', '<C-E>', '<End>')
vim.keymap.set('c', '<C-N>', '<Down>')
vim.keymap.set('c', '<C-P>', '<Up>')
vim.keymap.set('c', '<M-b>', '<S-Left>')
vim.keymap.set('c', '<M-f>', '<S-Right>')

-- Keep from adding to jump list
vim.keymap.set('n', 'n', "<cmd>keepjumps norm! " .. vim.v.count1 .. "n<cr>")
vim.keymap.set('n', 'N', "<cmd>keepjumps norm! " .. vim.v.count1 .. "N<cr>")
vim.keymap.set('n', '}', "<cmd>keepjumps norm! " .. vim.v.count1 .. "}<cr>")
vim.keymap.set('n', '{', "<cmd>keepjumps norm! " .. vim.v.count1 .. "{<cr>")

-- Make vinegar open vertically
vim.keymap.set('c', 'G<cr>', "vertical rightbelow G | norm ]]<cr>", { silent = true })

-- Remap window switch
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- FS manips
vim.keymap.set('n', '<leader>df', ':e %/')
vim.keymap.set('n', '<leader>dd', ':!mkdir %/')
vim.keymap.set('n', '<leader>dD', ':!rm -rf ')
vim.keymap.set('n', '<leader>dm', ':!mv ')

-- search and replace with confirmation
vim.keymap.set({ 'n', 'v' }, '<leader>fw', ':%s/<C-R><C-W>/gc<left><left><left>')

-- Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>')
vim.keymap.set({ 'n', 'v' }, 'g/', "<cmd>lua require('telescope.builtin').grep_string()<cr>")

-- Testing
vim.keymap.set('n', '<leader>tf', '<cmd>TestFile<cr>')
vim.keymap.set('n', '<leader>tn', '<cmd>TestNearest<cr>')

-- vim: ts=2 sts=2 sw=2 et
