-- [[ Useful plugin to show you pending keybinds ]]

-- NOTE: Plugins can also be configured to run lua code when they are loaded.

-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.

-- For example, in the following configuration, we use:
--  event = 'VimEnter'

-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).

-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end

return {
  {
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>d'] = { name = '[D]iagnostic', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]indow', _ = 'which_key_ignore' },
        ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' },
        ['<leader>e'] = { name = 'File [E]xplorer', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[G]oto', _ = 'which_key_ignore' },
        ['<leader>l'] = { name = 'LSP', _ = 'which_key_ignore' },
      }
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
