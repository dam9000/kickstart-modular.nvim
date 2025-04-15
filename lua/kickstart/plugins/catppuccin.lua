return {
  'catppuccin/nvim',
  name = 'catppuccin',
  enabled = true,
  priority = 1000,
  config = function()
    vim.opt.termguicolors = true

    local catppuccin = require 'catppuccin'

    catppuccin.setup {
      flavour = 'mocha',
      term_colors = true,
      styles = {
        conditionals = {},
        functions = { 'italic' },
        types = { 'bold' },
      },
      color_overrides = {
        mocha = {},
      },
      highlight_overrides = {
        mocha = function(C)
          return {
            NvimTreeNormal = { bg = C.none },
            CmpBorder = { fg = C.surface2 },
            Pmenu = { bg = C.none },
            NormalFloat = { bg = C.none },
            TelescopeBorder = { link = 'FloatBorder' },
          }
        end,
      },
      integrations = {
        blink_cmp = true,
        gitsigns = true,
        native_lsp = { enabled = true },
        nvimtree = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        notify = true,
        noice = true,
        markdown = true,
        snacks = true,
      },
    }

    vim.cmd.colorscheme 'catppuccin'
  end,
}
