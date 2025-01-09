if vim.fn.filereadable(vim.fn.getcwd() .. '/project.godot') == 1 then
  local addr = './godot.pipe'
  if vim.fn.has 'win32' == 1 then
    -- Windows can't pipe so use localhost. Make sure this is configured in Godot
    -- Exec Path: nvim
    -- Exec Flags: --server 127.0.0.1:6004 --remote-send "<esc>:n {file}<CR>:call cursor({line},{col})<CR>"
    addr = '127.0.0.1:6004'
  end
  vim.fn.serverstart(addr)
end

vim.keymap.set('n', '<leader>g', function()
  -- Find the project root (searches upwards for a .git folder)
  local root = vim.fn.finddir('.git', ';')
  if root == '' then
    vim.notify('Project root not found.', vim.log.levels.WARN)
    return
  end

  -- Get the current working directory (project root)
  local cwd = vim.fn.getcwd()

  -- Run gdformat
  vim.notify('Running: gdformat .', vim.log.levels.INFO)
  vim.fn.system('cd ' .. cwd .. ' && gdformat .')
  vim.cmd 'bufdo e!'

  -- Run gdlint and capture output
  vim.notify('Running: gdlint .', vim.log.levels.INFO)
  local lint_output = vim.fn.systemlist('cd ' .. cwd .. ' && gdlint .')

  -- Parse and add linting output to the quickfix list
  local qf_list = {}
  for _, line in ipairs(lint_output) do
    local file, line_num, msg = line:match '^(.-):(%d+):%s*(.+)$'
    if file and line_num and msg then
      table.insert(qf_list, {
        filename = file,
        lnum = tonumber(line_num),
        col = 1, -- Default column to 1 (gdlint doesn't specify columns)
        text = msg,
      })
    end
  end

  -- Set the quickfix list and open it if there are errors
  if #qf_list > 0 then
    vim.fn.setqflist(qf_list, 'r')
    vim.notify('Linting completed with errors. Quickfix list updated.', vim.log.levels.WARN)
    vim.cmd 'copen'
  else
    vim.notify('No linting errors found.', vim.log.levels.INFO)
  end
end, { desc = 'Format with gdformat and lint with gdlint (quickfix)' })
