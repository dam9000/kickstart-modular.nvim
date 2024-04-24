return {
   {
      'cbochs/grapple.nvim',
      opts = {
         scope = 'git_branch',
      },
      keys = {
         { '<C-a>', '<cmd>Grapple toggle<cr>', desc = 'T[a]g a file' },
         { ';', '<cmd>Grapple toggle_tags<cr>', desc = 'Show tags menu' },
         -- { '<C-h>', '<cmd>Grapple cycle_tags next<cr>', desc = 'Cycle next tag' },
         -- { '<C-j>', '<cmd>Grapple cycle_tags prev<cr>', desc = 'Cycle previous tag' },
         -- { '<c-1>', '<cmd>Grapple select index=1<cr>', desc = 'Select first tag' },
         -- { '<c-2>', '<cmd>Grapple select index=2<cr>', desc = 'Select second tag' },
         -- { '<c-3>', '<cmd>Grapple select index=3<cr>', desc = 'Select third tag' },
         -- { '<c-4>', '<cmd>Grapple select index=4<cr>', desc = 'Select fourth tag' },
      },
   },
}
