--[[

Configure Git integration for Neovim

Adds git related signs to the gutter_fg_grey and utilities for managing changes.
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
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Git [H]unk [S]tage' })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Git [H]unk [R]eset' })
        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Git [H]unk [S]tage buffer' })
        map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'Git [H]unk [U]ndo stage' })
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Git [H]unk [R]eset buffer' })
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Git [H]unk [P]review' })
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
