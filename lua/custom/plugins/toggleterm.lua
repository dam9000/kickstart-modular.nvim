return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 20,
      open_mapping = [[<c-\>]], -- This already has built-in toggle functionality
      hide_numbers = true,
      shade_terminals = true,
      direction = 'horizontal', -- 'vertical' | 'horizontal' | 'tab' | 'float'
      float_opts = {
        border = 'curved',
      },
    }

    -- Custom terminal keybindings with descriptions
    local Terminal = require('toggleterm.terminal').Terminal

    -- Floating terminal
    local float_term = Terminal:new {
      direction = 'float',
      float_opts = {
        border = 'double',
      },
    }

    -- Horizontal terminal
    local horizontal_term = Terminal:new {
      direction = 'horizontal',
    }

    -- Vertical terminal
    local vertical_term = Terminal:new {
      direction = 'vertical',
    }

    -- Keymaps with descriptions
    vim.keymap.set('n', '<leader>tf', function()
      float_term:toggle()
    end, { desc = '[T]erminal [F]loating' })
    vim.keymap.set('n', '<leader>th', function()
      horizontal_term:toggle()
    end, { desc = '[T]erminal [H]orizontal' })
    vim.keymap.set('n', '<leader>tv', function()
      vertical_term:toggle()
    end, { desc = '[T]erminal [V]ertical' })
    vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<cr>', { desc = '[T]oggle [T]erminal' })
    vim.keymap.set('n', '<leader>ta', '<cmd>ToggleTermToggleAll<cr>', { desc = '[T]erminal toggle [A]ll' })

    -- Terminal mode keymaps
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { desc = 'Terminal window left' })
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { desc = 'Terminal window down' })
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { desc = 'Terminal window up' })
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { desc = 'Terminal window right' })

    -- Send commands to terminal
    vim.keymap.set('n', '<leader>tg', function()
      horizontal_term:send 'git status'
    end, { desc = '[T]erminal [G]it status' })

    -- Multiple terminals
    vim.keymap.set('n', '<leader>t1', '<cmd>1ToggleTerm<cr>', { desc = '[T]erminal [1]' })
    vim.keymap.set('n', '<leader>t2', '<cmd>2ToggleTerm<cr>', { desc = '[T]erminal [2]' })
    vim.keymap.set('n', '<leader>t3', '<cmd>3ToggleTerm<cr>', { desc = '[T]erminal [3]' })
  end,
}
