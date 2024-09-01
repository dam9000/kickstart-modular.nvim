# Private changes

- Keymaps

  - Use traditional completion keymaps

- LSP

  - pylsp with all optional function turned on
    - Did not turn on 3rd party plugins
  - Auto install pylsp plugins at VimEnter
  - Auto clean up lsp servers at VimEnter

- Treesitter
  - Ensure languages are installed (e.g. python)
  - Enable incremental selection
  - Enable treesitter-context
  - Enable treesitter-textobjects (pending keymaps)

- Conform

  - Add 'Format' command for manual formater trigger
  - Add 'FormatEnable' and 'FormatDisable' toggling format on write
  - Default disable format on write
  - Add ruff_fix/ruff_format/ruff_organize_imports as python formater
  - Add sqlfluff as SQL formater
  - Add markdown-toc, markdownlint-cli2 and prettier as markdown formater

- Telescope

  - Change telescope UI into vertical mode

- Miscellaneous changes
  - JetbrainsMonoNL Nerd Font Mono
  - Relative line number
