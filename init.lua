--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = false

require 'options'
require 'keymaps'
require 'lazy-bootstrap'
require 'lazy-plugins'
