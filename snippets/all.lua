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

  -- advent of code
  s(
    { trig = 'aoc', dscr = 'start template s tidyverse in util.R za advent of code' },
    fmta(
      [[
        library(tidyverse)
        source("C:/Users/joene/Documents/progAAAAAAA/adventOfCode2023/util.R", chdir = TRUE, echo = TRUE)
        <>
      ]],
      { i(1) }
    )
  ),

  -- pipe operator
  s({ trig = 'pap', dscr = 'pipe operator v R-ju', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, fmta('%>>% <>', { i(1) })),

  -- R documentation
  s({ trig = 'doc', dscr = 'documentation znak za R funkcije', regTrig = false, wordTrig = true }, fmta("#' <>", { i(1) })),
}
