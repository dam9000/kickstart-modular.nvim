-- [[ Configure syntax highlighting, edit and navigate code ]]
-- See `:help nvim-treesitter`

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'bash',
        'lua',
        'markdown',
        'markdown_inline',
        'vim',
        'vimdoc',
        'python',
        'yaml',
        'sql',
        'toml',
        'terraform',
        'hcl',
        'proto',
        'json',
        'make',
        'dockerfile',
        'css',
      },
      auto_install = true, -- Autoinstall languages that are not installed
      highlight = {
        enable = true,

        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        -- If you are experiencing weird indenting issues, add the language to
        -- the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = {
        enable = true,
        disabled = { 'ruby' },
      },
    },
    config = function(_, opts)
      -- Prefer git instead of curl in order to improve connectivity in some environments
      require('nvim-treesitter.install').prefer_git = true

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)

      -- NOTE: There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --  * Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --  * Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --  * Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
