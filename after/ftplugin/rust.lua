-- This file contains settings that are only applied to rust files.

-- vim.g.rustaceanvim = {
--   tools = {
--   },
-- }
-- Keybinds must be set with `buffer = true`, if you don't want the bindings to be permanent for all buffers once it's been loaded.
vim.keymap.set('n', '<leader>us', function()
  vim.cmd.RustLsp { 'testables' }
end, { desc = '[S]how testables ', buffer = true })

vim.keymap.set('n', '<leader>ua', function()
  vim.cmd.RustLsp { 'testables', bang = true }
end, { desc = '[U]nittest previous [A]gain ', buffer = true })

vim.keymap.set('n', '<leader>da', function()
  vim.cmd.RustLsp { 'debuggables', bang = true }
end, { desc = '[D]ebug previous [A]gain ', buffer = true })

vim.keymap.set('n', '<leader>pe', function()
  vim.cmd.RustLsp { 'explainError', 'current' }
end, { desc = '[E]xplain this error ', buffer = true })

vim.keymap.set('n', '<leader>pd', function()
  vim.cmd.RustLsp { 'renderDiagnostic', 'current' }
end, { desc = '[P]opup [D]iagnostic ', buffer = true })

vim.keymap.set('n', 'gR', function()
  vim.cmd.RustLsp { 'relatedDiagnostics' }
end, { desc = '[G]oto [R]elated diagnostic ', buffer = true })
