-- [[ Configure easy motions for Neovim ]]

return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {},
  keys = {
    {
      '<leader>jp',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump()
      end,
      desc = '[J]ump to [P]attern',
    },
    {
      '<leader>jt',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').treesitter()
      end,
      desc = '[J]ump to syntax [T]ree block',
    },
    -- {
    --   'r',
    --   mode = 'o',
    --   function()
    --     require('flash').remote()
    --   end,
    --   desc = 'Remote Flash',
    -- },
    -- {
    --   'R',
    --   mode = { 'o', 'x' },
    --   function()
    --     require('flash').treesitter_search()
    --   end,
    --   desc = 'Treesitter Search',
    -- },
    -- {
    --   '<c-s>',
    --   mode = { 'c' },
    --   function()
    --     require('flash').toggle()
    --   end,
    --   desc = 'Toggle Flash Search',
    -- },
  },
}

-- vim: ts=2 sts=2 sw=2 et
