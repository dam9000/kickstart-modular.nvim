-- [[ Configure custom greeter ]]

return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.startify')

    dashboard.section.header.val = {
      -- [[                                                                       ]],
      -- [[                                                                       ]],
      -- [[                                                                       ]],
      -- [[                                                                       ]],
      -- [[                                                                     ]],
      -- [[       ████ ██████           █████      ██                     ]],
      -- [[      ███████████             █████                             ]],
      -- [[      █████████ ███████████████████ ███   ███████████   ]],
      -- [[     █████████  ███    █████████████ █████ ██████████████   ]],
      -- [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      -- [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      -- [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      -- [[                                                                       ]],
      -- [[                                                                       ]],
      -- [[                                                                       ]],
      [[  █████████████████████                                                          ████                                       ]],
      [[  ███████████████████████                                                        ████                                       ]],
      [[  ███████████████████████                                                        ████                                       ]],
      [[  ███████████████████████               ███████          ███████ ███      █████  ████         ███████          ███████████  ]],
      [[  ███████████████████████             ████████████     █████████████    ███████  ████       ███████████     ██████████████  ]],
      [[  ███████████████████████            ██████ ███████  ███████ ███████   ██████    ████     ███████ ███████  ███████ ███████  ]],
      [[  ███████████████████████           ████       ████  ████       ████   ███       ████     ████       ████ █████       ████  ]],
      [[  ███████████████████████           ████        ████ ███        ████  ████       ████     ███         ███ ████        ████  ]],
      [[  ███████████████████████           ████       ████  ████       ████  ████       ████     ████       ████ █████       ████  ]],
      [[  ███████████████████████           ███████ ███████  ███████ ███████  ████        █████    ██████ ███████  ███████ ███████  ]],
      [[  ███████████████████████           ██████████████    ██████████████  ████         ███████  ████████████    ██████████████  ]],
      [[  █████████████████████             ████████████         ███████ ███   ███           █████    ███████         ████████████  ]],
      [[  ████████████                      ████                                                                                    ]],
      [[  ████████████                      ████                                                                                    ]],
      [[   ███████████                      ████                                                                                    ]],
      [[    ██████████                                                                                                              ]],
      [[                                                                                                                            ]],
      [[                                                        N E O V I M                                                         ]],
    }

    dashboard.section.top_buttons.val = {
      dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
    }
    dashboard.section.bottom_buttons.val = {
      dashboard.button('q', '󰅚  Quit NVIM', ':qa<CR>'),
    }

    -- Disable MRU
    dashboard.section.mru.val = { { type = 'padding', val = 0 } }

    -- Set icons provider
    dashboard.file_icons.provider = 'devicons'

    -- Set footer
    local footer = [[
      
      Where people & AI join forces.
    ]]
    dashboard.section.footer.val = {
      {
        type = 'text',
        val = footer,
      },
    }

    -- Keymaps
    vim.keymap.set('n', '<leader>a', ':Alpha<CR>', { desc = 'Goto Greeter Screen' })

    -- Set colors
    -- stylua: ignore
    local highlight_groups = {
      parloa_miami_pink = { fg = '#E194F5', },
    }

    -- stylua: ignore
    local dashboard_opts_hl = {
      { { 'parloa_miami_pink', 1, 246 }, },
      { { 'parloa_miami_pink', 1, 246 }, },
      { { 'parloa_miami_pink', 1, 246 }, },
      { { 'parloa_miami_pink', 1, 346 }, },
      { { 'parloa_miami_pink', 1, 346 }, },
      { { 'parloa_miami_pink', 1, 346 }, },
      { { 'parloa_miami_pink', 1, 346 }, },
      { { 'parloa_miami_pink', 1, 346 }, },
      { { 'parloa_miami_pink', 1, 346 }, },
      { { 'parloa_miami_pink', 1, 346 }, },
      { { 'parloa_miami_pink', 1, 346 }, },
      { { 'parloa_miami_pink', 1, 346 }, },
      { { 'parloa_miami_pink', 1, 246 }, },
      { { 'parloa_miami_pink', 1, 246 }, },
      { { 'parloa_miami_pink', 1, 246 }, },
      { { 'parloa_miami_pink', 1, 246 }, },
      { { 'parloa_miami_pink', 1, 246 }, },
      { { 'parloa_miami_pink', 1, 246 }, },
    }

    for key, val in pairs(highlight_groups) do
      vim.api.nvim_set_hl(0, key, val)
    end

    dashboard.section.header.opts.hl = dashboard_opts_hl

    alpha.setup(dashboard.config)
  end,
}

-- vim: ts=2 sts=2 sw=2 et
