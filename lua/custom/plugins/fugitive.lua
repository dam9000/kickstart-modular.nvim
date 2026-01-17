return {
  { -- Git commands in nvim
    'tpope/vim-fugitive',
    event = 'VeryLazy',
    keys = {
      { '<leader>gs', '<cmd>Git<cr>', desc = 'Git status' },
      { '<leader>ga', '<cmd>w<cr><cmd>Git add %<cr>', desc = 'Save and git add current file' },
      { '<leader>gc', '<cmd>Git commit<cr>', desc = 'Git commit' },
      { '<leader>gp', '<cmd>Git push<cr>', desc = 'Git push' },
      { '<leader>gl', '<cmd>Git pull<cr>', desc = 'Git pull' },
      { '<leader>gd', '<cmd>Gvdiffsplit<cr>', desc = 'Git diff (vertical split)' },
      { '<leader>gD', '<cmd>Gvdiffsplit HEAD~1<cr>', desc = 'Git diff vs previous commit' },
      { '<leader>gb', '<cmd>Git blame<cr>', desc = 'Git blame' },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et

