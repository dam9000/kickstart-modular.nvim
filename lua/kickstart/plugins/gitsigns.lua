--[[

Configure Git integration for Neovim
Providing signs in the signcolumn to show changed/added/removed lines.
See `:help gitsigns`

--]]

return {
  {
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
        end, { desc = 'Goto next Git [H]unk' })
        map('n', '[h', function()
          if vim.wo.diff then
            vim.cmd.normal { '[h', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Goto previous Git [H]unk' })

        -- Visual mode keymaps
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Git [H]unk [S]tage' })
        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Git [H]unk [R]eset' })

        -- Normal mode keymaps
        map('n', '<leader>hb', gitsigns.blame_line, { desc = 'Git [H]unk [B]lame line' })
        map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Git [H]unk [D]iff against index' })
        map('n', '<leader>hD', function()
          gitsigns.diffthis '@'
        end, { desc = 'Git [H]unk [D]iff against last commit' })
      end,
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
