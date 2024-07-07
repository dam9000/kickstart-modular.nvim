return {
  'xeluxee/competitest.nvim',
  dependencies = 'MunifTanjim/nui.nvim',
  config = function()
    require('competitest').setup {
      cpp = {
        exec = 'g++',
        args = {
          '-std=c++17',
          '-g',
          '$(FNAME)',
          '-o',
          '$(FNOEXT)',
        },
      },
      template_file = {
        cpp = '~/Coding/code-compitative/c++/template.cpp',
      },
      save_current_file = true,
      view_output_diff = true,
      evaluate_template_modifiers = true,
      received_problems_path = '$(CWD)/$(GROUP)/$(PROBLEM).$(FEXT)',
      received_contests_directory = '$(CWD)/$(GROUP)',
      testcases_directory = './tests',
      layout = {
        { 1, {
          { 1, 'so' },
          { 1, {
            { 1, 'tc' },
            { 1, 'se' },
          } },
        } },
        { 1, {
          { 1, 'eo' },
          { 1, 'si' },
        } },
      },
    }
  end,
}
