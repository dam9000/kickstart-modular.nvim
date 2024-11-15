-- [[ Enable terminal inside Neovim ]]

return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    direction = 'vertical',
    start_in_insert = true,
    size = 80,
  },
  config = function(_, opts)
    function _G.set_terminal_keymaps()
      local keyopts = {buffer = 0}
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], keyopts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], keyopts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], keyopts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], keyopts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], keyopts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
    vim.keymap.set('n', '<leader>tt', ':ToggleTerm<CR>', { desc = '[T]oggle [T]erminal' })
    require('toggleterm').setup(opts)
  end,
}

-- vim: ts=2 sts=2 sw=2 et
