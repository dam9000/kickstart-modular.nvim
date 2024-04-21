-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`
vim.opt.autowrite = true

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
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

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
-- vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Neovide Settings
vim.g.neovide_cursor_vfx_mode = 'pixiedust'
vim.g.neovide_cursor_vfx_mode = 'ripple'
vim.g.neovide_floating_shadow = false
vim.g.neovide_transparency = 0.95
vim.g.neovide_floating_blur = true
vim.g.neovide_floating_blur_x = 2.0
vim.g.neovide_floating_blur_y = 2.0
vim.g.neovide_padding_top = 10
vim.g.neovide_padding_bottom = 10
vim.g.neovide_padding_left = 10
vim.g.neovide_padding_right = 10
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_theme = 'dark'
vim.o.guifont = 'JetBrainsMono_Nerd_Font:h12'

-- Like 'gf', but if the file doesn't exist, open Telescope with the filename
-- as the default text
-- Credit: justabubble123 on Discord
local function gf_telescope(cmd)
   local file = vim.fn.expand('<cfile>')
   if not file or file == '' then
      return
   end
   ---@diagnostic disable-next-line: param-type-mismatch
   if not vim.loop.fs_stat(file) then
      require('telescope.builtin').find_files({ default_text = file })
      return
   end
   vim.cmd((cmd or 'edit') .. ' ' .. file)
end

vim.keymap.set('n', 'gf', gf_telescope, { desc = 'Go to file under cursor' })

-- vim: ts=2 sts=2 sw=2 et
