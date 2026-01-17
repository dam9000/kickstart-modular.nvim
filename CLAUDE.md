# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a modular Neovim configuration based on [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim). It uses lazy.nvim for plugin management with a separation between core "kickstart" plugins and custom user plugins.

## Commands

```bash
# Format Lua files
stylua lua/

# Check Neovim config for errors
nvim --headless -c "checkhealth" -c "qa"

# View plugin status
nvim -c ":Lazy"

# Update plugins
nvim -c ":Lazy update"
```

## Architecture

### Directory Structure

```
init.lua                    # Entry point: leader keys, requires core modules
lua/
├── options.lua             # Vim editor options
├── keymaps.lua             # Global keybindings and window navigation
├── lazy-bootstrap.lua      # Auto-installs lazy.nvim on first run
├── lazy-plugins.lua        # Master plugin registry
├── kickstart/plugins/      # Core plugins (LSP, completion, telescope, treesitter, etc.)
└── custom/plugins/         # User plugins (auto-imported via { import = 'custom.plugins' })
```

### Plugin Organization

- **Core plugins** in `lua/kickstart/plugins/`: lspconfig, blink-cmp, telescope, treesitter, conform, gitsigns, which-key, todo-comments, mini
- **Optional plugins** (commented out): debug, indent_line, lint, autopairs, neo-tree
- **Custom plugins** in `lua/custom/plugins/`: dadbod, smart-splits, toggleterm, fugitive, lualine, kanagawa, chatgpt, ghostty, markdown-preview, render-markdown

Each plugin file returns a lazy.nvim spec table with configuration.

### Key Components

- **LSP**: nvim-lspconfig + mason.nvim (servers: pyright, bashls, lua_ls with dynamic Python venv detection)
- **Completion**: blink.cmp (Rust-based fuzzy matching) + LuaSnip
- **Formatting**: conform.nvim (stylua for Lua, ruff for Python, prettier for web, shfmt for bash)
- **Git**: vim-fugitive + gitsigns.nvim
- **Navigation**: telescope.nvim + smart-splits.nvim

### Keybinding Structure

Leader key is `<Space>`. Main groups (via which-key):

- `<leader>c` - Code actions
- `<leader>s` - Search (Telescope)
- `<leader>g` - Git
- `<leader>t` - Terminal
- `<leader>i` - ChatGPT AI

Window navigation: `<C-S-hjkl>` or `<C-arrows>` to move between splits, `<Alt-hjkl>` to resize.

## Code Style

Lua files use stylua with config in `.stylua.toml`:

- 2-space indentation
- 160 character line width
- Single quotes preferred
- No parentheses on single-argument function calls

## Adding New Plugins

Create a new file in `lua/custom/plugins/` returning a lazy.nvim spec:

```lua
return {
  {
    'author/plugin-name',
    event = 'VimEnter',  -- or other lazy-load trigger
    opts = {},
    config = function() ... end,
  }
}
```

The file will be auto-imported via the `{ import = 'custom.plugins' }` directive in lazy-plugins.lua.
