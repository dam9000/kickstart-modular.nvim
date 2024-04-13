return {
  {
    'cbochs/grapple.nvim',
    opts = {
      scope = 'git_branch',
    },
    keys = {
      { '<C-s>', '<cmd>Grapple toggle<cr>', desc = 'Tag a file' },
      { ';', '<cmd>Grapple toggle_tags<cr>', desc = 'Toggle tags menu' },
      { '<C-h>', '<cmd>Grapple cycle_tags next<cr>', desc = 'Grapple cycle next tag' },
      { '<C-j>', '<cmd>Grapple cycle_tags prev<cr>', desc = 'Grapple cycle previous tag' },
    },
  },
}
