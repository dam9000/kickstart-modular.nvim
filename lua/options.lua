-- [[ Setting options ]]

-- Make line numbers default
vim.wo.number = true

--  Add relative line numbers
vim.wo.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help clipboard`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Keeps indentation when wrapping lines for not fitting on the window
-- See `:help wrap`
vim.o.breakindent = true

-- Enable wrapping lines by whole words
vim.o.linebreak = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help list`
--  and `:help listchars`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', lead = '·' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
-- vim.o.scrolloff = 10

-- Enable 24-bit color
vim.o.termguicolors = true

-- Set configuration for tabs
-- See `:help tabstop` (using method 3)
vim.o.tabstop = 8
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = false

-- Set vertical line for code line limit
vim.o.colorcolumn = '120'

-- Set highlight on search
vim.o.hlsearch = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Set increments for resizing window splits
vim.g.tmux_resizer_resize_count = 2
vim.g.tmux_resizer_vertical_resize_count = 2

-- vim: ts=2 sts=2 sw=2 et
