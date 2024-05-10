-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<c-left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<c-right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<c-up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<c-down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands

-- let's play with alternatives
-- some options might be meta(alt), leader
-- i think meta makes more sense for now
-- SIKE we going back
-- harpoon must use meta
-- vim.keymap.set('n', '<M-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<M-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<M-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<M-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- sorry these have been stolen by grapple
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
--
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Copy buffer full path to clipboard
-- "yank path"
function CopyBufferNameToClipboard()
  local buffer_name = vim.api.nvim_buf_get_name(0)
  vim.fn.setreg('+', buffer_name)
  vim.cmd('echo "Buffer Name copied to clipboard: ' .. buffer_name .. '"')
end
vim.api.nvim_set_keymap('n', '<Leader>yp', ':lua CopyBufferNameToClipboard()<CR>', { noremap = true, silent = true })

-- Function to output all mappings to a file
-- see: https://stackoverflow.com/questions/7642746/is-there-any-way-to-view-the-currently-mapped-keys-in-vim
function OutputMappingsToFile()
  local file_path = 'vim_keys.txt'

  vim.cmd('redir! > ' .. file_path)
  vim.cmd 'silent verbose map'
  vim.cmd 'silent verbose imap'
  vim.cmd 'silent verbose vmap'
  vim.cmd 'silent verbose cmap'
  vim.cmd 'redir END'

  vim.cmd('echo "All mappings have been output to ' .. file_path .. '"')
end

-- Create a command in Neovim to call this function easily
vim.api.nvim_create_user_command('OutputMappings', OutputMappingsToFile, {})

-- vim: ts=2 sts=2 sw=2 et
