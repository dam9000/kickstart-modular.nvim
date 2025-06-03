-- Background transparent for the float windows
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = 'none', bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = 'none', bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatTitle', { fg = 'none', bg = 'none' })

-- No highlight references for the current word
vim.api.nvim_set_hl(0, 'LspReferenceText', { link = 'NONE' })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { link = 'NONE' })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { link = 'NONE' })

-- Background transparent for the blink suggestions
vim.api.nvim_set_hl(0, 'Pmenu', { fg = 'none', bg = 'none' })
-- vim.api.nvim_set_hl(0, "PmenuSel", { fg = "none", bg = "none" })
