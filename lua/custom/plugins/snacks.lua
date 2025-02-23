return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        header = [[
   ▄   ▄███▄   ████▄     ▄    ▀ █▀▄▀█
    █  █▀   ▀  █   █      █  ▄█ █ █ █
██   █ ██▄▄    █   █ █     █ ██ █   █
█ █  █ █▄   ▄▀ ▀████  █    █ ▐█ █   █
█  █ █ ▀███▀           █  █   ▐     █
█   ██                  ██          ▀]],
      },
      sections = {
        { section = 'header', padding = 2 },
        { section = 'keys', padding = 2 },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 2 },
        { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 2 },
        { section = 'startup' },
      },
    },
  },
}
