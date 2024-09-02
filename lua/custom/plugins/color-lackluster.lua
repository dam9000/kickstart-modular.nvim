return {
  'slugbyte/lackluster.nvim',
  lazy = false,
  config = function()
    -- vim.cmd.colorscheme 'lackluster'
    -- vim.cmd.colorscheme 'lackluster-hack' -- my favorite
    -- vim.cmd.colorscheme 'lackluster-mint'
    -- vim.cmd.colorscheme 'lackluster-night'
    vim.cmd.colorscheme 'lackluster-dark'

    -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
  end,
}
