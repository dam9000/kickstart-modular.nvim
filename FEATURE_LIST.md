# Full Feature List

- Keymaps

  - Use traditional completion keymaps

- LSP

  - Python
    - pylsp and ruff as LSP
      - Use pylint and flake8 over default setting
      - Did not turn on 3rd party plugins, except mypy
    - Auto install pylsp plugins at VimEnter (disabled)
  - Auto clean up lsp servers at VimEnter (disabled)
  - Add bashls as Bash LSP
  - Add sqlfluff as LSP
  - Show line diagnostics in hover window with custom UI
  - Show lsp error source

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
  - Add prettier and jq as json formater
  - Add shfmt as Bash formater
  - Add sqlfluff as formatter (dialect = postgres)

- Telescope

  - Change telescope UI into vertical mode

- Miscellaneous changes

  - JetbrainsMonoNL Nerd Font Mono
  - Relative line number
  - Add visual guide at 120 character limit

- Vim functionality
  - Enable spelling check
