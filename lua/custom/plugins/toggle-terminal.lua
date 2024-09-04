return {
  {
    'akinsho/toggleterm.nvim',
    event = 'VeryLazy',
    version = '*',
    opts = {
      open_mapping = '<c-s>',
      autochdir = true,
      -- on_open = function(term)
      --   -- Set the terminal's current working directory to the directory of the current buffer
      --   local buf_path = vim.fn.expand '%:p:h' -- Get the directory of the current file
      --   if buf_path ~= '' then
      --     term:change_dir(buf_path) -- Change the terminal's directory to the current buffer's directory
      --   end
      -- end,
      shading_factor = 1,
      close_on_exit = false,
      direction = 'tab', -- vertical, horizontal, tab, float
    },
  },
}
