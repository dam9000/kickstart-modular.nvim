-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
   -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
   'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

   { 'numToStr/Comment.nvim', opts = {} },

   require('kickstart/plugins/gitsigns'),

   require('kickstart/plugins/which-key'),

   require('kickstart/plugins/telescope'),

   require('kickstart/plugins/lspconfig'),

   require('kickstart/plugins/conform'),

   require('kickstart/plugins/cmp'),

   require('kickstart/plugins/todo-comments'),

   require('kickstart/plugins/mini'),

   require('kickstart/plugins/treesitter'),

   require('kickstart.plugins.debug'),
   require('kickstart.plugins.indent_line'),
   require('kickstart.plugins.lint'),

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

-- vim: ts=2 sts=2 sw=2 et
