local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

return {
  -- plugin
  s(
    { trig = 'plug', dscr = 'return table ta nov plugin' },
    fmta(
      [[
        return {
          <>
          enabled = true,
        }
      ]],
      { i(1) }
    )
  ),
}
