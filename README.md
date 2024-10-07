# nvim

My NeoVim configuration started as a fork from [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim)

## Installation

To install you need to be in the `~/.config/` folder and then run
```bash
git clone https://github.com/KikeSenpai/neovim.git nvim
```

## Modifications

- Changed colorscheme to tokyonight-moon and add other themes to choose from.
- Added indent-blankline configuration to have multiple colors.
- Added easymotion like plugin (hop).
- Added autopairs plugin.
- Added barbecue plugin for configuring LSP-based breadcrumbs.
- Added nvim-tree plugin for configuring file explorer.
- Replaced mini status line for lualine plugin.

## Prerequisites

- [ripgrep][1]: Needed for Telescope Fuzzy Finder.
- [xclip][2] Needed for system clipboard support.
- [npm/node][3] Needed for some LSP servers, plugins and tools.
- Golang (Also needed to install some LSP servers).

<!-- Links -->

[1]: https://github.com/BurntSushi/ripgrep

[2]: https://linuxconfig.org/how-to-use-xclip-on-linux

[3]: https://docs.npmjs.com/downloading-and-installing-node-js-and-npm
