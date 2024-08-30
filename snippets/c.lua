local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

-- include in main funckija, zato je base
return {
  s(
    { trig = 'base', dscr = 'include stdio.h in main funkcija z return 0', regTrig = false, wordTrig = true },
    fmta(
      [[
#include <<stdio.h>>
#include <<string.h>>

int main() {
    <>

    return 0;
}
]],
      { i(1) }
    )
  ),
}
