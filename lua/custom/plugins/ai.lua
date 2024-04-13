return {
  {
    'nomnivore/ollama.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    cmd = { 'Ollama', 'OllamaModel', 'OllamaServe', 'OllamaServeStop' },

    keys = {
      {
        '\\"',
        ":<c-u>lua require('ollama').prompt()<cr>",
        desc = 'Ollama Prompt',
        mode = { 'n', 'v' },
      },

      {
        "\\'",
        ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
        desc = 'Ollama Generate Code',
        mode = { 'n', 'v' },
      },
    },

    ---@type Ollama.Config
    opts = {
      model = 'gemma:7b',
      url = 'http://192.168.4.28:11434',
    },
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = '[[',
            jump_next = ']]',
            accept = '<CR>',
            refresh = 'gr',
            open = '<M-CR>',
          },
          layout = {
            position = 'bottom', -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = false,
          auto_trigger = false,
          debounce = 75,
          keymap = {
            accept = false,
            accept_word = false,
            accept_line = false,
            next = '<M-]>',
            prev = '<M-[>',
            dismiss = '<C-]>',
          },
        },
        filetypes = {
          go = true,
          typescript = true,
          ['*'] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
        server_opts_overrides = {},
        -- on_status_update = require('lualine').refresh,
      }
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    config = function()
      require('copilot_cmp').setup()
    end,
  },
}
