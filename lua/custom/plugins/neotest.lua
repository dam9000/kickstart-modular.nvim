return {
  -- {
--     'nvim-neotest/neotest',
--     dependencies = {
--       'nvim-neotest/nvim-nio',
--       'nvim-lua/plenary.nvim',
--       'antoinemadec/FixCursorHold.nvim',
--       'nvim-treesitter/nvim-treesitter',
--     },
--     config = function()
--       local neotest = require 'neotest'
--       neotest.setup {
--         adapters = { require 'rustaceanvim.neotest' },
--       }

--       local map = function(keys, func, desc)
--         vim.keymap.set('n', keys, func, { desc = desc })
--       end
--       map('<leader>ut', neotest.run.run(), 'run [U]nit test: [T]his')
--       map('<leader>uf', neotest.run.run(vim.fn.expand '%'), 'run all [U]nit tests in [F]ile')
--       map('<leader>du', neotest.run.run { strategy = 'dap' }, '[D]ebug this [U]nit test')
--     end,
--   },
}
