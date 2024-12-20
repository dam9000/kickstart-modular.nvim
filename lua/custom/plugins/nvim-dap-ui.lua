return {
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      local dap, dapui = require 'dap', require 'dapui'

      dapui.setup {
        controls = {
          element = 'console', -- Show the controls above the console, instead of above the repl
        },
        layouts = {
          {
            elements = {
              {
                id = 'watches',
                size = 0.2,
              },
              {
                id = 'scopes',
                size = 0.5,
              },
              {
                id = 'stacks',
                size = 0.3,
              },
              -- { -- Hide the breakpoints. We already know where they are.
              --   id = 'breakpoints',
              --   size = 0.25,
              -- },
            },
            position = 'left',
            size = 84,
          },
          {
            elements = {
              -- { -- Hide the repl (interactive therminal thing). Doesn't work for compiled languages.
              --   id = 'repl',
              --   size = 0.5,
              -- },
              {
                id = 'console',
                size = 1.0,
              },
            },
            position = 'bottom',
            size = 10,
          },
        },
        render = { max_type_length = 18 },
      }
      -- Open and close dap-ui automatically when dap opens.
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      vim.keymap.set('n', '<leader>de', dapui.eval, { desc = '[E]valuate symbol under cursor' })
    end,
  },
}
