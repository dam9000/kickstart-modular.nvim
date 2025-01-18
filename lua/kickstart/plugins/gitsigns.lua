--[[

Configure Git integration for Neovim
Providing signs in the signcolumn to show changed/added/removed lines.
See `:help gitsigns`

--]]

return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, lhs, rhs, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, lhs, rhs, opts)
      end

      -- NOTE: A hunk refers to a group of differing lines between two files.
      --
      -- Navigate between hunks
      map('n', ']h', function()
        if vim.wo.diff then
          vim.cmd.normal { ']h', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Next Git [H]unk' })
      map('n', '[h', function()
        if vim.wo.diff then
          vim.cmd.normal { '[h', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Previous Git [H]unk' })

      -- Keymaps
      map('n', '<leader>hb', gitsigns.blame_line, { desc = 'Git [B]lame Line' })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
