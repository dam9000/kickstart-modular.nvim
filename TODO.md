# TODO items

- Major issues:

  - Add file tree view
  - Refactoring support
  - Jump to usage/source support

- Minor issues:

  - Fix pyright pyspark issue
  - Allow usage/inheritance tracking
  - Make LSP errors/warnings appear on next line
    - Implement vim.diagnostic.open_float()
  - Allow multiple tabs
  - Add spelling check
  - Allow indenting/unindenting multiple lines
  - Allow commenting multiple lines
  - Allow find all within project scope
  - Add auto close brackets
  - Set up LSP and formatter for bash script
    - shfmt, shellcheck, bash LSP
  - Add preview capability for markdown files
  - Configure telescope/harpoon for use

- Miscellaneous issues:

  - Formater character limit
    - Set LSP warning for lines exceeding character limit
    - Add visual guide to 120 character limit
  - Add highlight support for line diff for git commit and merge requests
  - Allow highlighting and moving the line (like hightlight with 'shift'+'ctrl'+up/down arrow key)
  - Figure out a better way for autocomplete navigation and selection
  - Fix TODO highlight in docstring

- Nice to have
  - SQL LSP through local dll files
  - Go through LazyVim language setup for python/SQL/md
