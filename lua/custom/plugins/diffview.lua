return {
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory', 'DiffviewClose' },
    keys = {
      { '<leader>gv', '<cmd>DiffviewOpen<cr>', desc = 'Git diff view' },
      { '<leader>gV', '<cmd>DiffviewOpen HEAD~1<cr>', desc = 'Git diff vs previous' },
      { '<leader>gf', '<cmd>DiffviewFileHistory %<cr>', desc = 'Git file history' },
      { '<leader>gF', '<cmd>DiffviewFileHistory<cr>', desc = 'Git branch history' },
      { '<leader>gq', '<cmd>DiffviewClose<cr>', desc = 'Close diff view' },
    },
    opts = {},
  },
}
-- vim: ts=2 sts=2 sw=2 et
