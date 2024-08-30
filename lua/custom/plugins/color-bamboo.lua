return {
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup {
        style = 'vulgaris', -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
        transparent = false, -- Show/hide background
      }

      -- vim.cmd 'colorscheme bamboo'
    end,
  },
}
