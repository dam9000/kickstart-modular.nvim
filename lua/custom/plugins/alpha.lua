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
      [[                                                                                                                ]],
      [[                                                                                                                ]],
      [[                                                                                                                ]],
      [[  ████████                    ██           ██                    ████                         ████████          ]],
      [[         █████                ██           ██                 ████  █████                  ████                 ]],
      [[            ███               ██           ██               ███        ███                ██                    ]],
      [[             ██               ██           ██              ███           ██              ██                     ]],
      [[              ██              ██           ██              ██            ██          █████████████████████████  ]],
      [[             ██               ██           ██              ██            ██              ██                     ]],
      [[            ███                ██         ██               ██            ██               ██                    ]],
      [[         █████                  ████   ████                ██            ██                ████                 ]],
      [[  ████████                         █████                   ██            ██                   ████████          ]],
      [[                                                                                                                ]],
      [[                                                                                                                ]],
      [[                                                                                                                ]],
    }

    -- Set buttons
    dashboard.section.top_buttons.val = {
      dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
    }
    dashboard.section.bottom_buttons.val = {
      dashboard.button('q', '󰅚  Quit NVIM', ':qa<CR>'),
    }

    -- Disable MRU
    dashboard.section.mru.val = { { type = "padding", val = 0 } }

    -- Set footer
    local footer = [[
      
      I must not fear. Fear is the mind-killer. Fear is the little-death that brings total obliteration.
      I will face my fear. I will permit it to pass over me and through me. And when it has gone past
      I will turn the inner eye to see its path. Where the fear has gone there will be nothing. Only I will remain.
    ]]
    dashboard.section.footer.val = {
      {
        type = 'text',
        val = footer,
      },
    }

    -- Keymaps
    vim.keymap.set('n', '<leader>a', ':Alpha<CR>', { desc = 'Goto Greeter Screen' })

    alpha.setup(dashboard.config)
  end,
}

-- vim: ts=2 sts=2 sw=2 et
