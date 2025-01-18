-- [[ Useful plugin to show you pending keybinds ]]

return {
  'folke/which-key.nvim',
  event = 'VimEnter', -- Load after vim has started
  config = function() -- Setup configuration running after plugin is loaded
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').add {
      { '<leader>d', group = '[D]iagnostic' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>w', group = '[W]indow' },
      { '<leader>b', group = '[B]uffer' },
      { '<leader>e', group = 'File [E]xplorer' },
      { '<leader>g', group = '[G]oto' },
      { '<leader>l', group = '[L]SP' },
      { '<leader>j', group = '[J]ump anywhere' },
      { '<leader>h', group = 'Git [H]unks', mode = { 'n', 'v' } },
      { '<leader>o', group = '[O]bsidian' },
      { '<leader>p', group = 'S[p]ell Checking' },
      { '<leader>c', group = '[C]opilot', mode = { 'n', 'v' } },
    }
  end,
}

-- vim: ts=2 sts=2 sw=2 et
