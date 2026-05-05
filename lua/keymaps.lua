-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('i', 'jj', '<Esc>')

-- Toggle git diff highlight
vim.keymap.set('n', '<leader>tg', function()
  vim.cmd 'Gitsigns toggle_linehl'
end, { desc = 'Toggle git diff highlight' })

-- Toggle git diff highlight
vim.keymap.set('n', '<leader>bd', function()
  local alt = vim.fn.bufnr '#'
  vim.cmd 'bd'
  if alt > 0 and vim.fn.bufexists(alt) == 1 then
    vim.cmd('b ' .. alt)
  end
end, { desc = 'Close buffer and return to previous' })

-- Typescript console log snipper
vim.keymap.set('n', '<leader>cl', function()
  local line = vim.api.nvim_get_current_line()

  -- match: const foo =
  local var = line:match '^%s*const%s+([%w_]+)%s*='

  if not var then
    var = ''
    return
  end

  vim.api.nvim_put({
    string.format("console.log('🔥 %s:', %s);", var, var),
  }, 'l', true, true)
  vim.cmd 'normal! F,'
end, { desc = 'console.log with fire emoji' })

-- Replace text inside quotes/brackets with clipboard
vim.keymap.set('n', '<leader>r"', '"_di"\"+P', { desc = 'Replace inside " with clipboard' })
vim.keymap.set('n', "<leader>r'", '"_di\'"+P', { desc = "Replace inside ' with clipboard" })
vim.keymap.set('n', '<leader>r`', '"_di`"+P', { desc = 'Replace inside ` with clipboard' })
vim.keymap.set('n', '<leader>r(', '"_di("+P', { desc = 'Replace inside () with clipboard' })
vim.keymap.set('n', '<leader>r[', '"_di["+P', { desc = 'Replace inside [] with clipboard' })
vim.keymap.set('n', '<leader>r{', '"_di{"+P', { desc = 'Replace inside {} with clipboard' })

vim.keymap.set('n', '<leader>lg', function()
  vim.fn.jobstart({ 'tmux', 'split-window', '-h', 'lazygit' }, { detach = true })
end, { desc = 'Open LazyGit in tmux split' })

vim.keymap.set('n', '<leader>dc', function()
  require('docker').compose_up_service()
end, { desc = 'Compose up service' })

-- Navigation cheatsheet
vim.keymap.set('n', '<leader>?', function()
  local lines = {
    '  Navigation Cheatsheet              ',
    '',
    ' Jumplist (works after any jump)     ',
    '  <C-o>          go back             ',
    '  <C-i>          go forward          ',
    '  <C-t>          back after gd       ',
    '',
    ' LSP                                 ',
    '  gd             goto definition     ',
    '  grr            references          ',
    '  gri            implementation      ',
    '  grt            type definition     ',
    '  gO             document symbols    ',
    '  gW             workspace symbols   ',
    '  grn            rename symbol       ',
    '',
    ' Harpoon                             ',
    '  <leader>ha     pin file            ',
    '  <leader>hh     menu                ',
    '  <leader>1-4    jump to pin         ',
    '',
    ' Telescope                           ',
    '  <leader>p      find files          ',
    '  <leader>sg     live grep           ',
    '  <leader>sw     grep word           ',
    '  <leader>sr     resume last search  ',
    '  <leader><leader> open buffers      ',
    '  <leader>s.     recent files        ',
    '',
    ' Buffer                              ',
    '  <leader>bd     close, return prev  ',
    '  <C-h/j/k/l>    switch split        ',
    '',
    '  q / <Esc> to close                 ',
  }

  local width = 42
  local height = #lines
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].modifiable = false

  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    style = 'minimal',
    border = 'rounded',
  })

  local close = function()
    vim.api.nvim_win_close(win, true)
  end
  vim.keymap.set('n', 'q', close, { buffer = buf, nowait = true })
  vim.keymap.set('n', '<Esc>', close, { buffer = buf, nowait = true })
end, { desc = 'Navigation cheatsheet' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
