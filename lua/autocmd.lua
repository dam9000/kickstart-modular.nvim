local autocmdId = vim.api.nvim_create_augroup("autocmd.lua", { clear = false })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "FocusGained" }, {
  pattern = "*",
  command = "OneStatus",
  group = autocmdId,
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
  pattern = "*",
  command = "OneStatusClean",
  group = autocmdId,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man" },
  command = "wincmd L",
  group = autocmdId,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "dirvish",
  command = "nnoremap <buffer><silent> <C-p> <cmd>Telescope git_files<cr>",
  group = autocmdId,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
  command = "PrettierAsync",
  group = autocmdId,
})
