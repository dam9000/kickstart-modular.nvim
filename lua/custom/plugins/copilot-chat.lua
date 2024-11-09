-- [[ Configure Copilot Chat ]]

return {
  'CopilotC-Nvim/CopilotChat.nvim',
  branch = 'canary',
  dependencies = {
    { 'github/copilot.vim' },
    { 'nvim-lua/plenary.nvim' },
  },
  build = 'make tiktoken', -- Only on MacOS or Linux
  opts = {
    context = 'buffer', -- 'buffers', 'buffer' or none (can be specified manually in prompt via @)
    question_header = '## Enrique ',
    prompts = {
      Explain = {
        prompt = '/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.',
      },
      Fix = {
        prompt = '/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed.',
      },
      Optimize = {
        prompt = '/COPILOT_GENERATE Optimize the selected code to improve performance and readability.',
      },
      Docs = {
        prompt = '/COPILOT_GENERATE Please add documentation comment for the selection.',
      },
      Tests = {
        prompt = '/COPILOT_GENERATE Please generate tests for my code.',
      },
    },
    window = {
      layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
      width = 0.4, -- fractional width of parent, or absolute width in columns when > 1 (vertical)
      height = 0.5, -- fractional height of parent, or absolute height in rows when > 1 (horizontal)
      -- Options below only apply to floating windows
      relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
      border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
      row = nil, -- row position of the window, default is centered
      col = nil, -- column position of the window, default is centered
      title = 'Copilot Chat', -- title of chat window
      footer = nil, -- footer of chat window
      zindex = 1, -- determines if window is on top or below other floating windows
    },
    mappings = {
      complete = {
        detail = 'Use @<Tab> or /<Tab> for options.',
        insert = '<S-Tab>',
      },
      close = {
        normal = 'q',
        insert = '<C-c>',
      },
      reset = {
        normal = '<C-l>',
        insert = '<C-l>',
      },
      submit_prompt = {
        normal = '<CR>',
        insert = '<C-s>',
      },
      accept_diff = {
        normal = '<C-y>',
        insert = '<C-y>',
      },
      yank_diff = {
        normal = 'gy',
        register = '"',
      },
      show_diff = { normal = 'gd' },
      show_system_prompt = { normal = 'gp' },
      show_user_selection = { normal = 'gs' },
    },
  },
  config = function(_, opts)
    vim.keymap.set('n', '<leader>cc', ':CopilotChat<CR>', { desc = 'Open [C]opilot [C]hat' })
    vim.keymap.set('n', '<leader>ce', ':CopilotChatExplain<CR>', { desc = '[C]opilot Chat [E]xplain' })
    vim.keymap.set('n', '<leader>cq', function()
      local input = vim.fn.input 'Quick Chat: '
      local selection = require('CopilotChat.select').visual
      if not selection then
        selection = require('CopilotChat.select').buffer
      end
      if input ~= '' then
        require('CopilotChat').ask(input, { selection = selection })
      end
    end, { desc = 'Open [C]opilot [Q]uick Chat' })
    require('CopilotChat').setup(opts)
  end,
}

-- vim: ts=2 sts=2 sw=2 et
