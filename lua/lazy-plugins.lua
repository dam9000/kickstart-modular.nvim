-- [[ Configure and install plugins ]]

--  To check the current status of your plugins, run `:Lazy`

--  You can press `?` in this menu for help.

--  To update plugins, you can run `:Lazy update`

-- NOTE: Here is where you install your plugins.
require('lazy').setup {

  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  -- 'github/copilot.vim', -- Github copilot plugin

  -- NOTE: Plugins can also be added by using a table, with the first argument being
  -- the link and the following the plugin configuration.
  -- Use `opts = {}` to force a plugin to be loaded.
  --  This is equivalent to:
  --    require('Comment').setup({})
  { 'numToStr/Comment.nvim', opts = {} }, -- "gc" to comment visual regions/lines

  -- NOTE: modular approach: using `require 'path/name'` will include a plugin
  -- definition from file lua/path/name.lua
  require 'kickstart/plugins/gitsigns',
  require 'kickstart/plugins/which-key',
  require 'kickstart/plugins/telescope',
  require 'kickstart/plugins/lspconfig',
  require 'kickstart/plugins/conform',
  require 'kickstart/plugins/cmp',
  require 'kickstart/plugins/todo-comments',
  require 'kickstart/plugins/mini',
  require 'kickstart/plugins/treesitter',
  require 'kickstart/plugins/indent-line',

  -- TODO: Enable the debug plugin.
  --
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below can automatically add your own plugins, configuration,
  -- etc from `lua/custom/plugins/*.lua`. This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  { import = 'custom.plugins' },
}

-- vim: ts=2 sts=2 sw=2 et
