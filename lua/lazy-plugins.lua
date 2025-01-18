-- [[ Install plugins ]]

require('lazy').setup {
  -- NOTE: Plugins can be added with a link (or for a github repo: `owner/repo` link).
  --
  -- Github copilot plugin
  'github/copilot.vim',

  -- Seamless resizing between neovim and tmux window splits
  'RyanMillerC/better-vim-tmux-resizer',

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following the plugin configuration.
  -- Use `opts = {}` to force a plugin to be loaded, which is equivalent to: `require('Comment').setup {}`.
  --
  -- `gcc` to comment lines in normal mode and `gc` for visual mode
  { 'numToStr/Comment.nvim', opts = {} },

  -- Seamless navigation between neovim and tmux window splits
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
      'TmuxNavigatorProcessList',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },

  -- NOTE: Modular approach is using `require 'path.name'` to include a plugin from file `lua/path/name.lua`.
  require 'kickstart.plugins.gitsigns',
  require 'kickstart.plugins.which-key',
  require 'kickstart.plugins.telescope',
  require 'kickstart.plugins.lspconfig',
  require 'kickstart.plugins.conform',
  require 'kickstart.plugins.cmp',
  require 'kickstart.plugins.todo-comments',
  require 'kickstart.plugins.mini',
  require 'kickstart.plugins.treesitter',
  require 'kickstart.plugins.indent-blankline',
  require 'kickstart.plugins.tree',
  require 'kickstart.plugins.lint',

  -- NOTE: You can add several plugins from a folder `lua/custom/plugins/*.lua`
  { import = 'custom.plugins' },
}

-- vim: ts=2 sts=2 sw=2 et
