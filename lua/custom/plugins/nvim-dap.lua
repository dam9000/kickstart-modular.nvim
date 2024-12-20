return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require 'dap'
      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })
      vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug ▶️' })
      vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Debug ' })
      vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Debug ' })
      vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Debug ' })
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle [B]reakpoint' })
    end,
  },
}
