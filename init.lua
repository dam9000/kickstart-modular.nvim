--[[

=====================================================================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

TODO: If you don't know anything about Lua, I recommend taking some time to read through
  a guide. One possible example which will only take 10-15 minutes:
  - https://learnxinyminutes.com/docs/lua/
  After understanding a bit more about Lua, you can use `:help lua-guide` as a
  reference for how Neovim integrates Lua.
  - :help lua-guide
  - (or HTML version): https://neovim.io/doc/user/lua-guide.html

TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

TODO: Next, run AND READ `:help`.
  This will open up a help window with some basic information
  about reading, navigating and searching the builtin help documentation.

NOTE: The `:help` should be the first place you go to look when you're stuck or confused
  with something. It's one of my favorite neovim features.

NOTE: We provide a keymap `<space>sh` to [s]earch the [h]elp documentation,
  which is very useful when you're not sure exactly what you're looking for.

NOTE: If you experience any errors while trying to install kickstart, run `:checkhealth` for more info

--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Assign a virtualenv for Neovim so that the `pynvim` package is not required for each virtualenv
-- See `:help provider-python`
vim.g.python3_host_prog = '/home/eaperezd/.pyenv/versions/py3.11-nvim/bin/python'

-- Enable Copilot for specific filetypes_list
-- vim.g.copilot_filetypes = {
--   markdown = true,
--   python = true,
--   go = true,
--   yaml = true,
--   json = true,
--   toml = true,
--   lua = true,
--   rust = true,
--   sql = true,
-- }

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
