# Version history

- v0.2.0

  - LSP

    - Python
      - pylsp and ruff as LSP
        - Use pylint and flake8 over default setting
        - Did not turn on 3rd party plugins, except mypy
      - Auto install pylsp plugins at VimEnter (disabled)
    - Auto clean up lsp servers at VimEnter (disabled)
    - Add bashls as Bash LSP
    - Add sqlfluff as LSP

  - Conform

    - Add shfmt as Bash formater
    - Add sqlfluff as formatter (dialect = postgres)

- v0.1.0

  - Initial release

    - LSP

      - pyright

    - Conform

      - Add 'Format' command for manual formater trigger
      - Add 'FormatEnable' and 'FormatDisable' toggling format on write
      - Default disable format on write
      - Add ruff_fix/ruff_format/ruff_organize_imports as python formater
      - Add sqlfluff as SQL formater

    - Miscellaneous changes
      - JetbrainsMonoNL Nerd Font Mono
      - Relative line number
