vim.opt.relativenumber = true
--vim.opt.

local group = vim.api.nvim_create_augroup('jump_last_position', { clear = true })
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local row, col = unpack(vim.api.nvim_buf_get_mark(0, '"'))
    if { row, col } ~= { 0, 0 } then
      vim.api.nvim_win_set_cursor(0, { row, 0 })
    end
  end,
  group = group,
})

vim.keymap.set('n', ',e', ':e <C-R>=expand("%:p:h") .. "/"<CR>', { noremap = true })
vim.keymap.set('n', ',t', ':tabe <C-R>=expand("%:p:h") .. "/"<CR>', { noremap = true })
vim.keymap.set('n', ',s', ':split <C-R>=expand("%:p:h") .. "/"<CR>', { noremap = true })

vim.keymap.set('n', '<leader>ee', 'oif err != nil {<CR>}<Esc>Oreturn err<Esc>')
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
