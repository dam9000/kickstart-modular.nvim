return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  view_options = {
    show_hidden = true,
  },
  keymaps = {
    ['g?'] = { 'actions.show_help', mode = 'n' },
    ['<CR>'] = 'actions.select',
    ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
    ['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
    ['<C-t>'] = { 'actions.select', opts = { tab = true } },
    ['<C-p>'] = 'actions.preview',
    ['<C-c>'] = { 'actions.close', mode = 'n' },
    ['<leader>rr'] = 'actions.refresh',
    ['-'] = { 'actions.parent', mode = 'n' },
    ['_'] = { 'actions.open_cwd', mode = 'n' },
    ['`'] = { 'actions.cd', mode = 'n' },
    ['g~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
    ['gs'] = { 'actions.change_sort', mode = 'n' },
    ['gx'] = 'actions.open_external',
    ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
    ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
  },
  diagnostics = true,
  -- Optional dependencies
  dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
