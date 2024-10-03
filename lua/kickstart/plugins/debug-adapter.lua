-- [[ Configure Debug Adapter ]]

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui', -- Creates a beautiful debugger UI
    'nvim-neotest/nvim-nio', -- Dependency for nvim-dap-ui
    'mfussenegger/nvim-dap-python', -- Debugging for Python

    -- WARN: Make sure you have delve installed on your system.
    -- You can install it by running `go install github.com/go-delve/delve/cmd/dlv@latest`,
    -- or by running `brew install delve` on macOS.
    'leoluz/nvim-dap-go', -- Debugging for Go

  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    -- Keymaps
    vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[D]ebug Start/[C]ontinue' })
    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = '[D]ebug Toggle [B]reakpoint' })
    vim.keymap.set('n', '<leader>di', dap.step_into, { desc = '[D]ebug Step [I]nto' })
    vim.keymap.set('n', '<leader>dv', dap.step_over, { desc = '[D]ebug Step O[v]er' })
    vim.keymap.set('n', '<leader>do', dap.step_out, { desc = '[D]ebug: Step [O]ut' })
    vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = '[D]ebug Toggle [U]I' })

    -- Dap UI setup, for more information, see `:help nvim-dap-ui`.
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

    -- Set up specific debuggers
    require('dap-go').setup()
    require('dap-python').setup('/Users/enrique.delgado/.pyenv/versions/py3.10-nvim/bin/python')
  end,
}

-- vim: ts=2 sts=2 sw=2 et
