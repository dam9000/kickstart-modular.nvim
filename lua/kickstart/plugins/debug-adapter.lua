-- [[ Configure Debug Adapter ]]

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui', -- Creates a beautiful debugger UI
    'nvim-neotest/nvim-nio', -- Dependency for nvim-dap-ui
    'mfussenegger/nvim-dap-python', -- Debugging for Python
  },
  config = function()
    -- For more information see `:help dap-adapter`
    local dap = require 'dap'
    local dapui = require 'dapui'

    -- Keymaps
    vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[D]ebug Start/[C]ontinue' })
    vim.keymap.set('n', '<leader>di', dap.step_into, { desc = '[D]ebug Step [I]nto' })
    vim.keymap.set('n', '<leader>dv', dap.step_over, { desc = '[D]ebug Step O[v]er' })
    vim.keymap.set('n', '<leader>do', dap.step_out, { desc = '[D]ebug: Step [O]ut' })
    vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, { desc = '[D]ebug [T]oggle Breakpoint' })
    vim.keymap.set('n', '<leader>ds', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = '[D]ebug [S]et Breakpoint' })

    -- Toggle to see last session result
    -- NOTE: Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = '[D]ebug Toggle [U]I' })

    -- Signs configuration
    -- nvim-dap uses five signs:
    -- * `DapBreakpoint` for breakpoints (default: `B`)
    -- * `DapBreakpointCondition` for conditional breakpoints (default: `C`)
    -- * `DapLogPoint` for log points (default: `L`)
    -- * `DapStopped` to indicate where the debugee is stopped (default: `→`)
    -- * `DapBreakpointRejected` to indicate breakpoints rejected by the debug adapter (default: `R`)
    vim.api.nvim_set_hl(0, 'ColorSchemeRed', { fg = '#f7768e' })
    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'ColorSchemeRed', linehl = '', numhl = 'ColorSchemeRed' })

    -- Dap UI setup, for more information see `:help nvim-dap-ui`
    dapui.setup {
      icons = {
        expanded = '▾',
        collapsed = '▸',
        current_frame = '▸',
      },
      controls = {
        icons = {
          pause = '󰏤',
          play = '󰐊',
          run_last = '󰈑',
          disconnect = '',
          step_back = '',
          step_into = '',
          step_out = '',
          step_over = '',
          terminate = '󰓛',
        },
      },
    }

    -- Use nvim-dap events to open and close the windows automatically
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end

    -- Set up python debug adapter and virtual environment
    require('dap-python').setup '/Users/enrique.perez/.pyenv/versions/py3.12-debug-adapter/bin/python'
    require('dap-python').test_runner = 'pytest'
  end,
}

-- vim: ts=2 sts=2 sw=2 et
