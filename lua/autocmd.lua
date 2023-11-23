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
  callback = function ()
    -- Telescope
    vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
    vim.keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>')
    vim.keymap.set({ 'n', 'v' }, 'g/', "<cmd>lua require('telescope.builtin').grep_string()<cr>")
  end,
  group = autocmdId,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
  command = "PrettierAsync",
  group = autocmdId,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*",
  callback = function ()
    local packageDirectory = 'packages'

    local getPackageName = function ()
      local currentPath = vim.fn.expand('%')
      return string.match(currentPath, packageDirectory .. "/[^/]+")
    end

    vim.g['test#project_root'] = getPackageName()
  end,
  group = autocmdId,
})
