require('lazy').setup({
  require 'kickstart.plugins.autopairs',

  require 'kickstart/plugins/blink',

  require 'kickstart.plugins.catppuccin',

  require 'kickstart/plugins/conform',

  require 'kickstart/plugins/dap',

  require 'kickstart.plugins.debug',

  require 'kickstart/plugins/go',

  require 'kickstart/plugins/gitsigns',

  require 'kickstart.plugins.lint',

  require 'kickstart/plugins/lspconfig',

  require 'kickstart/plugins/mini',

  require 'kickstart/plugins/oil',

  require 'kickstart/plugins/sleuth',

  require 'kickstart/plugins/telescope',

  require 'kickstart/plugins/trouble',

  require 'kickstart/plugins/which-key',

  require 'kickstart/plugins/todo-comments',

  require 'kickstart/plugins/treesitter',

  { import = 'custom.plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
