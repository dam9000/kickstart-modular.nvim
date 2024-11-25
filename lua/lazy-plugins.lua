-- [[ Install plugins ]]

require('lazy').setup {
  -- NOTE: Plugins can be added with a link (or for a github repo: `owner/repo` link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'github/copilot.vim', -- Github copilot plugin

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following the plugin configuration.
  -- Use `opts = {}` to force a plugin to be loaded,
  -- which is equivalent to: `require('Comment').setup {}`.
  { 'numToStr/Comment.nvim', opts = {} }, -- "gc" to comment visual regions/lines

  -- NOTE: Modular approach is using `require 'path.name'` 
  -- to include a plugin definition from file `lua/path/name.lua`.
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
  require 'kickstart.plugins.debug-adapter',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.tree',
  require 'kickstart.plugins.lint',

  -- NOTE: You can add several plugins from a folder `lua/custom/plugins/*.lua`
  { import = 'custom.plugins' },
}

-- vim: ts=2 sts=2 sw=2 et
