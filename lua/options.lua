-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8

-- Wrapping on a word basis, so you don't dutt of words so much.
vim.o.linebreak = true
-- Add character to start of wrapped line.
vim.o.showbreak = ' ↪'

-- Neovide options
if vim.g.neovide then
  vim.o.guifont = 'JetBrainsMono Nerd Font:h9.5'
  vim.g.neovide_cursor_animation_length = 0.04
  vim.g.neovide_cursor_vfx_mode = 'wireframe'
  -- By default, neovide does not do anything with ctrl-shift-c / v, because that is typically handled by the terminal emulator. Hence, add this back in when running in neovide.
  vim.keymap.set('v', '<C-S-c>', '"+y') -- Copy to system clipboard in visual mode
  vim.keymap.set('n', '<C-S-v>', '"+P') -- Paste from system clipboard (normal mode)
  vim.keymap.set('v', '<C-S-v>', '"+P') -- Paste from system clipboard (visual mode)
  vim.keymap.set('i', '<C-S-v>', '<ESC>"+P') -- Paste from system clipboard (insert mode)
  vim.keymap.set('c', '<C-S-v>', '<C-R>+') -- Paste from system clipboard (command mode)
end

-- vim: ts=2 sts=2 sw=2 et
