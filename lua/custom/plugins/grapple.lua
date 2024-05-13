-- return {
--   'otavioschwanck/arrow.nvim',
--   opts = {
--     show_icons = true,
--     leader_key = ';', -- Recommended to be a single key
--     buffer_leader_key = 'm', -- Per Buffer Mappings
--   },
-- }

-- 5.12.24 we are phasing out grapple
-- its only utility is to pin files to specific scopes
-- let's try out grapple
-- note the following are equivalent
-- :Grapple cycle_tags next scope=cwd
-- require("grapple").cycle_tags("next", { scope = "cwd" })
return {
  'cbochs/grapple.nvim',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' },
  },
  opts = {
    scope = 'git_branch',
    icons = true,
    quick_select = '123456789',
  },
  -- use my own keys
  keys = {
    -- { '<M-m>', '<cmd>Grapple toggle_tags<cr>', desc = 'Toggle tags menu' },

    -- { '<M-s>', '<cmd>Grapple toggle<cr>', desc = 'Toggle tag' },
    -- { '<M-n>', '<cmd>Grapple cycle_tags next<cr>', desc = 'Go to next tag' },
    -- { '<M-p>', '<cmd>Grapple cycle_tags prev<cr>', desc = 'Go to previous tag' },

    -- { '<M-h>', '<cmd>Grapple select index=1<cr>', desc = 'Select first tag' },
    -- { '<M-j>', '<cmd>Grapple select index=2<cr>', desc = 'Select second tag' },
    -- { '<M-k>', '<cmd>Grapple select index=3<cr>', desc = 'Select third tag' },
    -- { '<M-l>', '<cmd>Grapple select index=4<cr>', desc = 'Select fourth tag' },
    -- { '<M-;>', '<cmd>Grapple select index=5<cr>', desc = 'Select fifth tag' },
    --
    -- { '<M-j>', '<cmd>Grapple select index=1<cr>', desc = 'Select first tag' },
    -- { '<M-k>', '<cmd>Grapple select index=2<cr>', desc = 'Select second tag' },
    -- { '<M-l>', '<cmd>Grapple select index=3<cr>', desc = 'Select third tag' },
    -- { '<M-;>', '<cmd>Grapple select index=4<cr>', desc = 'Select fourth tag' },

    -- sixth tag does not work
    -- { "<M-'>", '<cmd>Grapple select index=6<cr>', desc = 'Select sixth tag' },
  },
}

-- and how about arrow?
-- return {
--   'otavioschwanck/arrow.nvim',
--   opts = {
--     show_icons = true,
--     leader_key = ';', -- Recommended to be a single key
--     buffer_leader_key = 'm', -- Per Buffer Mappings
--   },
-- }
