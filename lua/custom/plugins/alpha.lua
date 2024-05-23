-- [[ Configure custom greeter ]]

return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.startify'
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
      -- [[                                                                                                                ]],
      -- [[                                                                                                                ]],
      -- [[                                                                                                                ]],
      -- [[  ████████                    ██           ██                    ████                         ████████          ]],
      -- [[         █████                ██           ██                 ████  █████                  ████                 ]],
      -- [[            ███               ██           ██               ███        ███                ██                    ]],
      -- [[             ██               ██           ██              ███           ██              ██                     ]],
      -- [[              ██              ██           ██              ██            ██          █████████████████████████  ]],
      -- [[             ██               ██           ██              ██            ██              ██                     ]],
      -- [[            ███                ██         ██               ██            ██               ██                    ]],
      -- [[         █████                  ████   ████                ██            ██                ████                 ]],
      -- [[  ████████                         █████                   ██            ██                   ████████          ]],
      -- [[                                                                                                                ]],
      -- [[                                                                                                                ]],
      -- [[                                                  N E O V I M                                                   ]],
      [[                      ▒▒▒▒▒▒▒▒▒▒▒▒▒▒                                                                                                        ]],
      [[                 ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                                                                                                   ]],
      [[              ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                 ██████     ██████ ██████████████ ██████        ██████            ██████████    ]],
      [[           ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒         ██████     ██████ ██████████████ ██████        ██████          ██████████████  ]],
      [[         ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒       ██████     ██████ ██████         ██████        ██████         ████████████████ ]],
      [[        ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒       ██████  █████████ ██████         ██████        ██████        ██████      ██████]],
      [[      ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒        █████████████████ █████████████  ██████        ██████        █████        █████]],
      [[     ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒         █████████████████ █████████████  ██████        ██████        █████        █████]],
      [[    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒         ████████   ██████ ██████         ██████        ██████        ██████      ██████]],
      [[   ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒          ██████     ██████ ██████         █████████████ █████████████  ████████████████ ]],
      [[   ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒          ██████     ██████ ██████████████ █████████████ █████████████   ██████████████  ]],
      [[  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒          ██████     ██████ ██████████████ █████████████ █████████████     ██████████    ]],
      [[  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                                                                                         ]],
      [[  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒          █████████████ █████████████    █████████████   ████████████   ██████     ██████]],
      [[  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒          █████████████ ███████████████  █████████████ ███████████████  ██████     ██████]],
      [[  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒           ██████        ██████    ██████ ██████        ██████           ██████     ██████]],
      [[  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒            ██████        ██████     █████ ██████        ███████████      ██████  █████████]],
      [[ ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒             ████████████  ███████████████  ████████████  ███████████████  █████████████████]],
      [[▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒              ████████████  ██████████████   ████████████     █████████████ █████████████████]],
      [[▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒               ██████        █████████████    ██████                 ███████ ████████   ██████]],
      [[▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                 ██████        ██████ █████████ ██████        ████████████████ ██████     ██████]],
      [[ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                   ██████        ██████  ████████ █████████████ ███████████████  ██████     ██████]],
      [[         ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                     ██████        ██████     █████ █████████████    ██████████    ██████     ██████]],
      [[            ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒                                                                                                       ]],
      [[                ▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒                                                                                                            ]],
      [[                                                                                                                                            ]],
      [[                                                                N E O V I M                                                                 ]],
    }

    -- Set buttons
    dashboard.section.top_buttons.val = {
      dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
    }
    dashboard.section.bottom_buttons.val = {
      dashboard.button('q', '󰅚  Quit NVIM', ':qa<CR>'),
    }

    -- Disable MRU
    dashboard.section.mru.val = { { type = 'padding', val = 0 } }

    -- Set footer
    -- local footer = [[
    --
    --   I must not fear. Fear is the mind-killer. Fear is the little-death that brings total obliteration.
    --   I will face my fear. I will permit it to pass over me and through me. And when it has gone past
    --   I will turn the inner eye to see its path. Where the fear has gone there will be nothing. Only I will remain.
    -- ]]
    local footer = [[
      
      We want to change the way people eat. Forever.
    ]]
    dashboard.section.footer.val = {
      {
        type = 'text',
        val = footer,
      },
    }

    -- Keymaps
    vim.keymap.set('n', '<leader>a', ':Alpha<CR>', { desc = 'Goto Greeter Screen' })

    -- Set colors for HelloFresh logo
    -- stylua: ignore
    local highlight_groups = {
      tokyo_night_moon_green = { fg = '#c3e88d', },
      tokyo_night_moon_blue = { fg = '#82aaff', },
    }

    -- stylua: ignore
    local dashboard_opts_hl = {
      { { 'tokyo_night_moon_green', 24, 64 }, },
      { { 'tokyo_night_moon_green', 19, 89 }, },
      { { 'tokyo_night_moon_green', 16, 104 }, },
      { { 'tokyo_night_moon_green', 13, 134 }, },
      { { 'tokyo_night_moon_green', 11, 144 }, },
      { { 'tokyo_night_moon_green', 3, 152 }, },
      { { 'tokyo_night_moon_green', 3, 152 }, },
      { { 'tokyo_night_moon_green', 3, 152 }, },
      { { 'tokyo_night_moon_green', 3, 152 }, },
      { { 'tokyo_night_moon_green', 3, 152 }, },
      { { 'tokyo_night_moon_green', 3, 152 }, },
      { { 'tokyo_night_moon_green', 3, 152 }, },
      { { 'tokyo_night_moon_green', 3, 152 }, },
      { { 'tokyo_night_moon_green', 3, 152 }, },
      { { 'tokyo_night_moon_green', 3, 152 }, },
      { { 'tokyo_night_moon_green', 3, 152 }, },
      { { 'tokyo_night_moon_green', 3, 152 }, },
      { { 'tokyo_night_moon_green', 3, 152 }, },
      { { 'tokyo_night_moon_green', 0, 152 }, },
      { { 'tokyo_night_moon_green', 0, 152 }, },
      { { 'tokyo_night_moon_green', 0, 132 }, },
      { { 'tokyo_night_moon_green', 3, 125 }, },
      { { 'tokyo_night_moon_green', 3, 125 }, },
      { { 'tokyo_night_moon_green', 3, 152 }, },
      { { 'tokyo_night_moon_green', 3, 152 }, },
      { { 'tokyo_night_moon_blue', 3, 152 }, },
      { { 'tokyo_night_moon_blue', 3, 152 }, },
    }

    for key, val in pairs(highlight_groups) do
      vim.api.nvim_set_hl(0, key, val)
    end

    dashboard.section.header.opts.hl = dashboard_opts_hl

    alpha.setup(dashboard.config)
  end,
}

-- vim: ts=2 sts=2 sw=2 et
