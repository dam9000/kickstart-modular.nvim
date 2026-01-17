return {
  -- Core DB client
  {
    'tpope/vim-dadbod',
    name = 'vim-dadbod',
    lazy = true,
  },

  -- SQL omnifunc completion (works without nvim-cmp/blink integration)
  {
    'kristijanhusak/vim-dadbod-completion',
    name = 'vim-dadbod-completion',
    ft = { 'sql', 'mysql', 'plsql' },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'sql', 'mysql', 'plsql' },
        callback = function()
          vim.bo.omnifunc = 'vim_dadbod_completion#omni'
        end,
      })
    end,
  },

  -- DB UI
  {
    'kristijanhusak/vim-dadbod-ui',
    name = 'vim-dadbod-ui',
    dependencies = { 'vim-dadbod', 'vim-dadbod-completion' },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
      'DBUIRenameBuffer',
      'DBUILastQueryInfo',
      -- custom helper commands (defined in `init`)
      'DBConnectPostgres',
      'DBConnectSqlite',
    },
    init = function()
      -- UI preferences
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_save_location = vim.fn.stdpath('data') .. '/dadbod_ui'

      local function ensure_dadbod_loaded()
        local ok, lazy = pcall(require, 'lazy')
        if not ok then
          return
        end
        lazy.load { plugins = { 'vim-dadbod', 'vim-dadbod-completion', 'vim-dadbod-ui' } }
      end

      local function urlencode(s)
        s = tostring(s or '')
        return (s:gsub('[^%w%-%._~]', function(c)
          return string.format('%%%02X', string.byte(c))
        end))
      end

      local function dbs()
        if type(vim.g.dbs) ~= 'table' then
          vim.g.dbs = {}
        end
        return vim.g.dbs
      end

      local function save_connection_to_file(connection_name, url)
        local save_dir = vim.g.db_ui_save_location
        if type(save_dir) ~= 'string' or save_dir == '' then
          save_dir = vim.fn.stdpath('data') .. '/dadbod_ui'
          vim.g.db_ui_save_location = save_dir
        end

        -- Normalize / ensure folder exists
        save_dir = (save_dir:gsub('/$', ''))
        vim.fn.mkdir(save_dir, 'p')

        local file = save_dir .. '/connections.json'
        local connections = {}

        if vim.fn.filereadable(file) == 1 then
          local content = table.concat(vim.fn.readfile(file), '\n')
          local ok, decoded = pcall(vim.json.decode, content)
          if ok and vim.tbl_islist(decoded) then
            connections = decoded
          end
        end

        local updated = false
        for _, conn in ipairs(connections) do
          if type(conn) == 'table' and conn.name == connection_name then
            conn.url = url
            updated = true
            break
          end
        end

        if not updated then
          table.insert(connections, { name = connection_name, url = url })
        end

        vim.fn.writefile({ vim.json.encode(connections) }, file)
      end

      local function open_ui(url)
        vim.g.db = url
        vim.cmd 'DBUI'
      end

      vim.api.nvim_create_user_command('DBConnectPostgres', function(opts)
        ensure_dadbod_loaded()

        local name = vim.trim(opts.args or '')
        if name == '' then
          name = nil
        end

        local state = {
          host = nil,
          port = '5432',
          dbname = nil,
          user = nil,
          password = nil,
          sslmode = 'prefer',
        }

        local function finish()
          if not (state.host and state.dbname and state.user) then
            vim.notify('DBConnectPostgres: cancelled', vim.log.levels.INFO)
            return
          end

          local user = urlencode(state.user)
          local pass = state.password and state.password ~= '' and (':' .. urlencode(state.password)) or ''
          local host = state.host
          local port = state.port and state.port ~= '' and state.port or '5432'
          local dbname = urlencode(state.dbname)

          local url = string.format('postgres://%s%s@%s:%s/%s', user, pass, host, port, dbname)
          if state.sslmode and state.sslmode ~= '' then
            url = url .. '?sslmode=' .. urlencode(state.sslmode)
          end

          local entry_name = name or string.format('pg:%s/%s', host, state.dbname)
          dbs()[entry_name] = url
          save_connection_to_file(entry_name, url)

          vim.notify('DB: connected ' .. entry_name, vim.log.levels.INFO)
          open_ui(url)
        end

        -- Step-by-step prompts (sequential)
        vim.ui.input({ prompt = 'Postgres host: ' }, function(host)
          host = host and vim.trim(host) or ''
          if host == '' then
            vim.notify('DBConnectPostgres: cancelled', vim.log.levels.INFO)
            return
          end
          state.host = host

          vim.ui.input({ prompt = 'Postgres port: ', default = state.port }, function(port)
            port = port and vim.trim(port) or ''
            if port ~= '' then
              state.port = port
            end

            vim.ui.input({ prompt = 'Database name: ' }, function(dbname)
              dbname = dbname and vim.trim(dbname) or ''
              if dbname == '' then
                vim.notify('DBConnectPostgres: cancelled', vim.log.levels.INFO)
                return
              end
              state.dbname = dbname

              vim.ui.input({ prompt = 'User: ' }, function(user)
                user = user and vim.trim(user) or ''
                if user == '' then
                  vim.notify('DBConnectPostgres: cancelled', vim.log.levels.INFO)
                  return
                end
                state.user = user

                -- Password: use inputsecret so it won't echo
                local password = vim.fn.inputsecret 'Password (leave empty for none): '
                state.password = password
                if password ~= nil and password ~= '' then
                  vim.notify('DBConnectPostgres: password will be saved in connections.json', vim.log.levels.WARN)
                end

                vim.ui.input({ prompt = 'sslmode: ', default = state.sslmode }, function(sslmode)
                  sslmode = sslmode and vim.trim(sslmode) or ''
                  if sslmode ~= '' then
                    state.sslmode = sslmode
                  end
                  finish()
                end)
              end)
            end)
          end)
        end)
      end, {
        nargs = '?',
        desc = 'Prompt for remote Postgres connection, save it, and open DBUI',
      })

      vim.api.nvim_create_user_command('DBConnectSqlite', function(opts)
        ensure_dadbod_loaded()

        local arg = vim.trim(opts.args or '')
        local function connect(path)
          path = path and vim.trim(path) or ''
          if path == '' then
            vim.notify('DBConnectSqlite: cancelled', vim.log.levels.INFO)
            return
          end

          local abs = vim.fn.fnamemodify(vim.fn.expand(path), ':p')
          local url = 'sqlite:' .. abs
          local entry_name = 'sqlite:' .. vim.fn.fnamemodify(abs, ':t')

          dbs()[entry_name] = url
          save_connection_to_file(entry_name, url)
          vim.notify('DB: connected ' .. entry_name, vim.log.levels.INFO)
          open_ui(url)
        end

        if arg ~= '' then
          connect(arg)
          return
        end

        vim.ui.input({ prompt = 'SQLite file path: ', default = vim.fn.getcwd() .. '/' }, function(path)
          connect(path)
        end)
      end, {
        nargs = '?',
        complete = 'file',
        desc = 'Connect to a local SQLite file, save it, and open DBUI',
      })

      -- Convenience mappings (work even before plugins load; commands are created here)
      vim.keymap.set('n', '<leader>Du', '<cmd>DBUIToggle<CR>', { desc = 'DB: Toggle UI' })
      vim.keymap.set('n', '<leader>Dp', '<cmd>DBConnectPostgres<CR>', { desc = 'DB: Connect Postgres (prompt)' })
      vim.keymap.set('n', '<leader>Ds', '<cmd>DBConnectSqlite<CR>', { desc = 'DB: Connect SQLite (prompt)' })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
