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
    question_header = '## Enrique ',

    -- NOTE: Context to use (can be specified manually in prompt via #).
    -- It can be one of: `buffer`, `buffers`, `file`, `files`, `git`.
    context = nil,

    -- Selection defaults to null if there is no visual selection.
    selection = function(source)
      local select = require 'CopilotChat.select'
      local visual_selection = select.visual(source)
      if visual_selection then
        return visual_selection
      else
        return nil
      end
    end,
    prompts = {
      Explain = {
        prompt = '/COPILOT_EXPLAIN\n\nWrite an explanation for the selected code.',
      },
      Review = {
        prompt = '/COPILOT_REVIEW\n\nReview the selected code.',
      },
      Fix = {
        prompt = '/COPILOT_GENERATE\n\nThere is a problem in the selected code. Rewrite the code with the bug fixed.',
      },
      Optimize = {
        prompt = '/COPILOT_GENERATE\n\nOptimize the selected code to improve performance and readability.',
      },
      Docs = {
        prompt = '/COPILOT_GENERATE\n\nPlease add documentation comments to the selected code.',
      },
      Tests = {
        prompt = '/COPILOT_GENERATE\n\nPlease generate tests for the selected code.',
      },
      Commit = {
        prompt = '#git:staged\n\nWrite commit message for the changes using the conventional commits specification.',
        mapping = '<leader>cc',
        description = 'Write a [C]ommit Message',
      },
      PrDescription = {
        prompt = '#pr\n\nPlease generate a description for a pull request using the context provided from the git diff between the current branch and the main branch. It should have two sections: #1 titled What does this PR do? (with an emoji of a thinking face) describing the main goal and summary of the pull request, and #2 Detailed Changes (with the memo emoji) describing all changes, do not put the file names just describe the changes.',
        mapping = '<leader>cp',
        description = 'Write a [P]ull Request description',
      },
    },
    contexts = {
      pr = {
        input = function(callback)
          callback()
        end,
        resolve = function()
          local handle = io.popen 'git diff main...HEAD'
          if handle == nil then
            return ''
          end
          local result = handle:read '*a'
          handle:close()

          return {
            {
              content = result,
              filename = 'pr_diff',
              filetype = 'diff',
            },
          }
        end,
      },
    },
    window = {
      layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
      width = 80, -- fractional width of parent, or absolute width in columns when > 1 (vertical)
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
    vim.keymap.set({ 'n', 'v', 'x' }, '<leader>co', ':CopilotChat<CR>', { desc = '[O]pen Chat' })
    vim.keymap.set({ 'v', 'x' }, '<leader>ce', ':CopilotChatExplain<CR>', { desc = 'Write Code [E]xplanation' })
    require('CopilotChat').setup(opts)
  end,
}

-- vim: ts=2 sts=2 sw=2 et
