# TODO items

- Major issues:

  - No check for classmethod vs abstractmethod sequence
  - Warn if a class method is static
  - Use LSP to rename/delete files

- Minor issues:

  - Make LSP errors/warnings appear on next line
    - Implement vim.diagnostic.open_float()
  - Add spelling check
  - Allow indenting/unindenting multiple lines
  - Add auto close brackets
  - Set up LSP and formatter for bash script
    - shfmt, shellcheck, bash LSP
  - Add preview capability for markdown files
  - Add json formatter
  - leader f formating does not use current line length setting
  - Auto detect vertical/horizontal monitor for telescope layout

- Miscellaneous issues:

  - Formater character limit
    - Add visual guide to 120 character limit
  - Add highlight support for line diff for git commit and merge requests
  - Allow highlighting and moving the line
    (like hightlight with 'shift'+'ctrl'+up/down arrow key)
  - Figure out a better way for autocomplete navigation and selection
  - Fix TODO highlight in docstring
  - Add Mason ensure uninstalled (for pyright)

- Nice to have
  - SQL LSP through local dll files
  - Go through LazyVim language setup for python/SQL/md
