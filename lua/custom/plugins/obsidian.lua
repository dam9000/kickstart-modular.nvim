-- [[ Configure Integration with Obsidian ]]

return {
  'epwalsh/obsidian.nvim',
  version = '*', -- Use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '~/Library/CloudStorage/OneDrive-Personal/Documentos/enrique-perez-obsidian',
      },
    },
  },
  config = function(_, opts)
    -- Keymaps
    vim.keymap.set('n', '<leader>os', ':ObsidianSearch<CR>', { desc = '[S]earch [O]bisidan' })
    vim.keymap.set('n', '<leader>oo', ':ObsidianOpen<CR>', { desc = '[O]pen in [O]bisidan App' })
    vim.keymap.set('n', '<leader>oc', ':lua require("obsidian").util.toogle_checkbox()<CR>', { desc = 'Toogle [O]bisidan [C]heckbox' })

    require('obsidian').setup(opts)
  end,
}

-- vim: ts=2 sts=2 sw=2 et
