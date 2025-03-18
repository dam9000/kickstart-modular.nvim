-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

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
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = '[P]roject [V]iew' })

-- You may have stolen the following, but you will NOT use it, before you
-- understand what it does!
-- You may only uncomment a line, if you write a comment about what it does!

-- When you press J in visual mode with this remap set, it will move the
-- selected block of text down by one line and re-indent it to match the
-- surrounding code's indentation style, all while keeping the text selected.
-- This is particularly useful for quickly reorganizing lines or blocks of code
-- without losing your place or having to manually re-indent and re-select the
-- text.
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down and reindent' })

-- This remap allows you to quickly move a block of selected text up by one
-- line in visual mode, while also maintaining proper indentation and keeping
-- the text selected. It enhances editing efficiency, particularly when
-- reorganizing code blocks or paragraphs of text.
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up and reindent' })

-- This remap allows you to join the current line with the next one using the J
-- command in normal mode, but instead of leaving the cursor at the end of the
-- joined line (which is the default behavior), it returns the cursor to its
-- original position before the lines were joined. This is particularly useful
-- for maintaining your place in a document when editing, as it prevents you
-- from having to manually navigate back to where you were after joining lines.
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines without moving cursor' })

-- The remap ensures that after you scroll down half a screen, the line with
-- the cursor is brought to the center of the screen. This can make it easier
-- to keep track of where you are in the file, especially when navigating
-- through long documents, by keeping your current position more centrally
-- located in the viewport.
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll half-page down and center cursor' })

-- The remap ensures that after you scroll up half a screen, the line with
-- the cursor is brought to the center of the screen. This can make it easier
-- to keep track of where you are in the file, especially when navigating
-- through long documents, by keeping your current position more centrally
-- located in the viewport.
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll half-page down and center cursor' })

-- This remap enhances the usability of the n command for navigating search
-- results in normal mode. It ensures that when you jump to the next occurrence
-- of your search term, the line with the match is centered on your screen,
-- and any folds concealing it are opened, making it easier to immediately see
-- and assess the context of your matches without manually adjusting your view
-- or dealing with folds.
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Repeat search forward and center cursor' })

-- This remap enhances the usability of the N command for navigating search
-- results in normal mode. It ensures that when you jump to the previous
-- occurrence of your search term, the line with the match is centered on your
-- screen, and any folds concealing it are opened, making it easier to
-- immediately see and assess the context of your matches without manually
-- adjusting your view or dealing with folds.
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Repeat search backward and center cursor' })

vim.keymap.set('n', '=ap', "ma=ap'a", { desc = 'Reindent paragraph and restore cursor position' })

vim.keymap.set('n', '<leader>zig', '<cmd>LspRestart<cr>', { desc = 'LSP: Restart servers' })

-- vim.keymap.set("n", "<leader>vwm", function()
--      require("vim-with-me").StartVimWithMe()
--  end)
--  vim.keymap.set("n", "<leader>svwm", function()
--      require("vim-with-me").StopVimWithMe()
--  end)

-- This remap deletes the currently selected text without affecting the
-- clipboard (using the black hole register) and then paste the previously
-- yanked or copied text before the deleted area.
--
-- This remap is particularly useful for replacing a selection with the
-- contents of the clipboard without altering the clipboard's contents during
-- the process. It enhances the default paste behavior by ensuring that what
-- you're about to replace doesn't overwrite what you have in your clipboard,
-- making repeated paste operations more convenient and predictable.
-- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste without overwriting register' })

-- Pressing <leader>y in normal mode will copy the current line or the current
-- selection in visual mode to the system clipboard. This remap makes it easy
-- to copy text from Neovim directly to the clipboard, allowing you to paste
-- it into other applications outside of Neovim.
--
-- The use of the system clipboard register "+ is particularly useful for users
-- working in graphical environments or using terminal emulators that support
-- clipboard integration, facilitating a smoother workflow between Neovim and
-- other applications.
-- next greatest remap ever : asbjornHaland
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank to end of line to system clipboard' })

-- Pressing <leader>d in normal mode will delete the current line without
-- copying it to any register you might later accidentally paste from. In
-- visual mode, it will delete the selected text without copying it. This remap
-- is particularly useful for deleting text that you know you won't need to
-- paste elsewhere, keeping your registers clean for more important yanks and
-- deletes.
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete without yanking' })

-- This is going to get me cancelled
vim.keymap.set('i', '<C-c>', '<Esc>')

-- The practical effect of this remap is to prevent accidental presses of Q
-- from switching Neovim into Ex mode, which can be disruptive to your workflow
-- if you don't use Ex mode commands regularly. It's a way of customizing Neovim
-- to better suit your usage patterns and preferences, making the editor behave
-- more predictably according to your expectations.
vim.keymap.set('n', 'Q', '<nop>')

-- The practical effect of this remap is to provide a quick and convenient way
-- to format your code according to the standards and guidelines of the language
-- server currently in use. It enhances code readability and consistency,
-- especially in collaborative projects where adhering to a common style guide
-- is important.
--
-- To use this remap effectively, you must have an LSP server configured and
-- running for the language of the code you're editing. This feature is part of
-- Neovim's powerful LSP integration, which provides IDE-like functionalities
-- such as diagnostics, code completion, and, as shown here, document
-- formatting.
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'LSP: Format buffer with LSP' })

-- The practical effect of this remap is to improve navigation efficiency
-- within the quickfix list, making it easier to cycle through items like
-- compile errors or search results, with the added convenience of centering
-- the screen on each item for better visibility. This can significantly speed
-- up tasks such as debugging or reviewing search matches across a project.
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz', { desc = 'Next quickfix item and center screen' })
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz', { desc = 'Previous quickfix item and center screen' })

-- The practical effect of this remap is to facilitate efficient navigation
-- through the items (such as errors, warnings, or search results) in the
-- location list of the current window, with the additional convenience of
-- centering the screen on each item for better visibility and context. This
-- can be especially useful for workflows involving code review or debugging,
-- where you need to quickly and systematically address multiple issues within
-- a single file or closely related set of files.
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', { desc = 'Next location list item and center screen' })
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', { desc = 'Previous location list item and center screen' })

-- This remap is particularly useful for quickly setting up a template for
-- global, case-insensitive replacement of the word under the cursor throughout
-- the entire file. After triggering the command, you'll be left in command-line
-- mode with the cursor positioned to easily edit the replacement text,
-- streamlining the process of performing such replacements.
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Search and replace word under cursor' })

-- Pressing <leader>x in normal mode will make the current file executable
-- without leaving Neovim or opening a terminal window. This can be particularly
-- useful for scripts or other executable files that you're working on directly
-- in Neovim.
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { desc = 'Add executable permission to file', silent = true })

-- A quick golang template to insert an error check
vim.keymap.set('n', '<leader>ee', 'oif err != nil {<CR>}<Esc>Oreturn err<Esc>', { desc = 'Insert Go error handling block' })

vim.keymap.set('n', '<leader>ea', 'oassert.NoError(err, "")<Esc>F";a', { desc = 'Insert Go test assertion assert.NoError' })

vim.keymap.set(
  'n',
  '<leader>ef',
  'oif err != nil {<CR>}<Esc>Olog.Fatalf("error: %s\\n", err.Error())<Esc>jj',
  { desc = 'Insert Go error handling with log.Fatalf' }
)

vim.keymap.set(
  'n',
  '<leader>el',
  'oif err != nil {<CR>}<Esc>O.logger.Error("error", "error", err)<Esc>F.;i',
  { desc = 'Insert Go error handling with logger.Error' }
)

-- Don't take it so seriously
vim.keymap.set('n', '<leader>ca', function()
  require('cellular-automaton').start_animation 'make_it_rain'
end, { desc = 'Angry-tableflip the buffer' })

-- This remap provides a shorthand to the ':so' command, which sources the
-- current file, effectively re-running it as a script. This can be useful for
-- quickly applying changes to your configuration or other scripts without
-- having to manually reload Neovim or open a new terminal window.
vim.keymap.set('n', '<leader><leader>', function()
  vim.cmd 'so'
end, { desc = 'Source current file' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    -- vim.highlight.on_yank()
    vim.highlight.on_yank {
      higroup = 'IncSearch',
      timeout = 40,
    }
  end,
})

-- vim: ts=2 sts=2 sw=2 et
