-- [[ Useful plugin to show you pending keybinds ]]

return {
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>d'] = { name = '[D]iagnostic/[D]ebugger', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]indow', _ = 'which_key_ignore' },
        ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' },
        ['<leader>e'] = { name = 'File [E]xplorer', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[G]oto', _ = 'which_key_ignore' },
        ['<leader>l'] = { name = '[L]SP', _ = 'which_key_ignore' },
        ['<leader>j'] = { name = '[J]ump anywhere', _ = 'which_key_ignore' },
        ['<leader>h'] = { name = 'Git [H]unks', _ = 'which_key_ignore' },
        ['<leader>o'] = { name = '[O]bsidian Notes', _ = 'which_key_ignore' },
      }
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
