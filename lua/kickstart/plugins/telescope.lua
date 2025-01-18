--[[

Configure fuzzy finder (Telescope)

Telescope is a fuzzy finder that comes with a lot of different things that
it can fuzzy find! It's more than just a "file finder", it can search
many different aspects of Neovim, your workspace, LSP, and more!

--]]

return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons' },
  },
  config = function()
    -- You can put your default mappings / updates / etc. in here.
    --  All the info you're looking for is in `:help telescope.setup()`.
    require('telescope').setup {
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },
      pickers = {
        live_grep = {
          additional_args = { '--hidden' },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable telescope extensions, if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Search by [F]ilename' })
    vim.keymap.set('n', '<leader>sb', builtin.builtin, { desc = 'Search Telescope [B]uiltin' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Search Current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Search Files by [G]rep' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Search Recent Files' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Search Open Files' })
    vim.keymap.set('n', '<leader>dl', builtin.diagnostics, { desc = 'Open Diagnostics [L]ist' })
    vim.keymap.set('n', '<leader>jl', builtin.jumplist, { desc = 'Open Jump[l]ist' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
        prompt_title = 'Live grep in current buffer',
      })
    end, { desc = 'Search Buffer by Grep' })

    -- Also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = 'Search Opened Files by Grep' })

    -- Shortcut for searching your neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Search [N]eovim Config Files' })
  end,
}

-- vim: ts=2 sts=2 sw=2 et
