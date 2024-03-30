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
