local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

local is_math_mode = require 'snippets.math-util'

-- NOTE: Tukaj vstavljaš snippets za markdown
return {
  -- Get in math mode
  s({ trig = 'mk', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, fmta('$<>$', { i(1) })),
  s(
    { trig = 'dm', regTrig = false, wordTrig = true, snippetType = 'autosnippet' },
    fmta(
      [[
    $$
    <>
    $$
    ]],
      { i(1) }
    )
  ),
  -- environment
  s(
    { trig = 'beg', name = 'Begin environment', regTrig = false, wordTrig = true, snippetType = 'autosnippet' },
    fmta(
      [[
    \begin{<>}
    <>
    \end{<>}
    ]],
      { i(1), i(0), rep(1) }
    )
  ),

  -- Greek letters
  s({ trig = '@a', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\alpha', { condition = is_math_mode }),
  s({ trig = '@b', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\beta', { condition = is_math_mode }),
  s({ trig = '@g', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\gamma', { condition = is_math_mode }),
  s({ trig = '@G', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\Gamma', { condition = is_math_mode }),
  s({ trig = '@d', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\delta', { condition = is_math_mode }),
  s({ trig = '@D', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\Delta', { condition = is_math_mode }),
  s({ trig = '@e', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\epsilon', { condition = is_math_mode }),
  s({ trig = ':e', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\varepsilon', { condition = is_math_mode }),
  s({ trig = '@z', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\zeta', { condition = is_math_mode }),
  s({ trig = '@t', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\theta', { condition = is_math_mode }),
  s({ trig = '@T', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\Theta', { condition = is_math_mode }),
  s({ trig = ':t', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\vartheta', { condition = is_math_mode }),
  s({ trig = '@i', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\iota', { condition = is_math_mode }),
  s({ trig = '@k', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\kappa', { condition = is_math_mode }),
  s({ trig = '@l', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\lambda', { condition = is_math_mode }),
  s({ trig = '@L', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\Lambda', { condition = is_math_mode }),
  s({ trig = '@s', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\sigma', { condition = is_math_mode }),
  s({ trig = '@S', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\Sigma', { condition = is_math_mode }),
  s({ trig = '@u', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\upsilon', { condition = is_math_mode }),
  s({ trig = '@U', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\Upsilon', { condition = is_math_mode }),
  s({ trig = '@o', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\omega', { condition = is_math_mode }),
  s({ trig = '@O', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\Omega', { condition = is_math_mode }),
  s({ trig = 'ome', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\omega', { condition = is_math_mode }),
  s({ trig = 'Ome', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\varOmega', { condition = is_math_mode }),

  -- Text environment
  s({ trig = 'text', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, { t '\\text{', i(0, ''), t '}' }),
  s({ trig = '"', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, { t '\\text{', i(0, ''), t '}' }),

  -- Basic operations
  s({ trig = 'sr', regTrig = true, wordTrig = false, snippetType = 'autosnippet' }, t '^{2}'),
  s({ trig = 'cb', regTrig = true, wordTrig = false, snippetType = 'autosnippet' }, t '^{3}'),
  s({ trig = 'rd', regTrig = true, wordTrig = true, snippetType = 'autosnippet' }, { t '^{', i(0, ''), t '}' }),
  s({ trig = '_', regTrig = true, wordTrig = false, snippetType = 'autosnippet' }, { t '_{', i(0, ''), t '}' }),
  s({ trig = 'sts', regTrig = true, wordTrig = false, snippetType = 'autosnippet' }, { t '_\\text{', i(0, ''), t '}' }),
  s('//', { t '\\frac{', i(0, ''), t '}{', i(1, ''), t '}' }),
  s('ee', { t 'e^{', i(0, ''), t '}' }),
  s({ trig = 'invs', regTrig = true, wordTrig = false, snippetType = 'autosnippet' }, t '^{-1}'),
  s('([^\\])(exp|log|ln)', t '[[0]]\\[[1]]'),
  s('conj', t '^{*}'),
  s({ trig = 'RR', regTrig = true, wordTrig = true, snippetType = 'autosnippet' }, t '\\mathrm{RR}'),
  s({ trig = 'bf', regTrig = true, wordTrig = true, snippetType = 'autosnippet' }, { t '\\mathbf{', i(0, ''), t '}' }),
  s({ trig = 'rm', regTrig = true, wordTrig = true, snippetType = 'autosnippet' }, { t '\\mathrm{', i(0, ''), t '}' }),

  -- Linear algebra
  s('([^\\])(det)', t '[[0]]\\[[1]]'),
  s('trace', t '\\mathrm{Tr}'),

  -- More operations
  s({ trig = '([a-zA-Z])hat', regTrig = true, wordTrig = false, snippetType = 'autosnippet' }, { t '\\hat{', i(0, ''), t '}' }, { condition = is_math_mode }),
  s({ trig = '([a-zA-Z])bar', regTrig = true, wordTrig = false, snippetType = 'autosnippet' }, { t '\\bar{', i(0, ''), t '}' }, { condition = is_math_mode }),
  s(
    { trig = '([a-zA-Z])tilde', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    { t '\\tilde{', i(0, ''), t '}' },
    { condition = is_math_mode }
  ),
  s({ trig = '([a-zA-Z])und', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, fmta('\\underline{<>}', { i(1) }), { condition = is_math_mode }),
  s({ trig = '([a-zA-Z])vec', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, fmta('\\vec{<>}', { i(1) }), { condition = is_math_mode }),
  s({ trig = '([a-zA-Z]),\\.', regTrig = true, wordTrig = false, snippetType = 'autosnippet' }, fmta('\\mathbf{<>}', { i(1) }), { condition = is_math_mode }),
  s({ trig = '([a-zA-Z])\\.,', regTrig = true, wordTrig = false, snippetType = 'autosnippet' }, fmta('\\mathbf{<>}', { i(1) }), { condition = is_math_mode }),
  s(
    { trig = '\\\\(${GREEK}),\\.', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    fmta('\\boldsymbol{\\<>}', { i(1) }),
    { condition = is_math_mode }
  ),
  s(
    { trig = '\\\\(${GREEK})\\.,', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    fmta('\\boldsymbol{\\<>}', { i(1) }),
    { condition = is_math_mode }
  ),

  -- Subscripts
  s({ trig = 'xnn', regTrig = true, wordTrig = true, snippetType = 'autosnippet' }, t 'x_{n}', { condition = is_math_mode }),
  s({ trig = 'xjj', regTrig = true, wordTrig = true, snippetType = 'autosnippet' }, t 'x_{j}', { condition = is_math_mode }),
  s({ trig = 'xp1', regTrig = true, wordTrig = true, snippetType = 'autosnippet' }, t 'x_{n+1}', { condition = is_math_mode }),
  s({ trig = 'ynn', regTrig = true, wordTrig = true, snippetType = 'autosnippet' }, t 'y_{n}', { condition = is_math_mode }),
  s({ trig = 'yii', regTrig = true, wordTrig = true, snippetType = 'autosnippet' }, t 'y_{i}', { condition = is_math_mode }),
  s({ trig = 'yjj', regTrig = true, wordTrig = true, snippetType = 'autosnippet' }, t 'y_{j}', { condition = is_math_mode }),

  -- Symbols
  s({ trig = 'ooo', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\infty', { condition = is_math_mode }),
  s({ trig = 'sum', regTrig = true, wordTrig = true, snippetType = 'autosnippet' }, t '\\sum', { condition = is_math_mode }),
  s({ trig = 'prod', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\prod', { condition = is_math_mode }),
  s(
    { trig = '\\sum', regTrig = false, wordTrig = true, snippetType = 'autosnippet' },
    fmta('\\sum_{<>}^<> <>', { i(1, 'i=1'), i(2, 'N'), i(0) }),
    { condition = is_math_mode }
  ),
  s(
    { trig = '\\prod', regTrig = true, wordTrig = true, snippetType = 'autosnippet' },
    fmta('\\prod_{<>}^<> <>', { i(1, 'i=1'), i(2, 'N'), i(0) }),
    { condition = is_math_mode }
  ),
  s(
    { trig = 'lim', regTrig = true, wordTrig = true, snippetType = 'autosnippet' },
    fmta('\\lim_{<> \\to <>} <>', { i(1, 'n'), i(2, '\\infty'), i(0) }),
    { condition = is_math_mode }
  ),
  s({ trig = 'nabl', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\nabla', { condition = is_math_mode }),
  s({ trig = 'del', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\nabla', { condition = is_math_mode }),
  s({ trig = 'xx', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\times', { condition = is_math_mode }),
  s({ trig = 'para', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\parallel', { condition = is_math_mode }),

  -- Comparisons and equivalence
  s({ trig = '===', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\equiv', { condition = is_math_mode }),
  s({ trig = '!=', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\neq', { condition = is_math_mode }),
  s({ trig = '>=', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\geq', { condition = is_math_mode }),
  s({ trig = '<=', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\leq', { condition = is_math_mode }),
  s({ trig = '>>', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\gg', { condition = is_math_mode }),
  s({ trig = '<<', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\ll', { condition = is_math_mode }),
  s({ trig = 'simm', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\sim', { condition = is_math_mode }),
  s({ trig = 'sim=', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\simeq', { condition = is_math_mode }),
  s({ trig = 'prop', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\propto', { condition = is_math_mode }),

  -- Arrows
  s({ trig = '<->', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\leftrightarrow ', { condition = is_math_mode }),
  s({ trig = '->', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\to', { condition = is_math_mode }),
  s({ trig = '=>', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\implies', { condition = is_math_mode }),
  s({ trig = '=<', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, t '\\impliedby', { condition = is_math_mode }),

  -- Sets and relations
  s({ trig = 'orr', regTrig = true, wordTrig = true, snippetType = 'autosnippet' }, t '\\cup', { condition = is_math_mode }),
  s({ trig = 'inn', regTrig = true, wordTrig = true, snippetType = 'autosnippet' }, t '\\in', { condition = is_math_mode }),
  s({ trig = 'notin', regTrig = true, wordTrig = true, snippetType = 'autosnippet' }, t '\\not\\in', { condition = is_math_mode }),
  s({ trig = 'sub=', regTrig = true, wordTrig = true, snippetType = 'autosnippet' }, t '\\subseteq', { condition = is_math_mode }),
  s({ trig = 'sup=', regTrig = true, wordTrig = true, snippetType = 'autosnippet' }, t '\\supseteq', { condition = is_math_mode }),
  s({ trig = 'eset', regTrig = true, wordTrig = true, snippetType = 'autosnippet' }, t '\\emptyset', { condition = is_math_mode }),
  s({ trig = 'cap', regTrig = true, wordTrig = true, snippetType = 'autosnippet' }, t '\\cap', { condition = is_math_mode }),
  s({ trig = 'cup', regTrig = true, wordTrig = true, snippetType = 'autosnippet' }, t '\\cup', { condition = is_math_mode }),

  -- System of equations
  s(
    { trig = 'eqns', regTrig = false, wordTrig = true, snippetType = 'autosnippet' },
    fmta(
      [[
            \begin{cases}
            <>
            \end{cases}
            ]],
      { i(1) }
    ),
    { condition = is_math_mode }
  ),

  -- Matrix
  s(
    { trig = 'mat', regTrig = false, wordTrig = true, snippetType = 'autosnippet' },
    fmta(
      [[
            \begin{matrix}
            <>
            \end{matrix}
            ]],
      { i(1) }
    ),
    { condition = is_math_mode }
  ),
  s(
    { trig = 'bmat', regTrig = false, wordTrig = true, snippetType = 'autosnippet' },
    fmta(
      [[
            \begin{bmatrix}
            <>
            \end{bmatrix}
            ]],
      { i(1) }
    ),
    { condition = is_math_mode }
  ),
  s(
    { trig = 'pmat', regTrig = false, wordTrig = true, snippetType = 'autosnippet' },
    fmta(
      [[
            \begin{pmatrix}
            <>
            \end{pmatrix}
            ]],
      { i(1) }
    ),
    { condition = is_math_mode }
  ),
  s(
    { trig = 'vmat', regTrig = false, wordTrig = true, snippetType = 'autosnippet' },
    fmta(
      [[
            \begin{vmatrix}
            <>
            \end{vmatrix}
            ]],
      { i(1) }
    ),
    { condition = is_math_mode }
  ),
  s(
    { trig = 'Vmat', regTrig = false, wordTrig = true, snippetType = 'autosnippet' },
    fmta(
      [[
            \begin{Vmatrix}
            <>
            \end{Vmatrix}
            ]],
      { i(1) }
    ),
    { condition = is_math_mode }
  ),

  -- Definitions and Theorems
  s({ trig = 'defn', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, fmta('\\begin{definition}\n  <>\n\\end{definition}', { i(1) })),
  s({ trig = 'thm', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, fmta('\\begin{theorem}\n  <>\n\\end{theorem}', { i(1) })),
  s({ trig = 'prop', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, fmta('\\begin{proposition}\n  <>\n\\end{proposition}', { i(1) })),
  s({ trig = 'lem', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, fmta('\\begin{lemma}\n  <>\n\\end{lemma}', { i(1) })),
  s({ trig = 'cor', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, fmta('\\begin{corollary}\n  <>\n\\end{corollary}', { i(1) })),
  s({ trig = 'proof', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, fmta('\\begin{proof}\n  <>\n\\end{proof}', { i(1) })),

  -- Text formatting
  s({ trig = 'textit', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, fmta('\\textit{<>}', { i(1) })),
  s({ trig = 'textbf', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, fmta('\\textbf{<>}', { i(1) })),
  s({ trig = 'textsf', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, fmta('\\textsf{<>}', { i(1) })),
  s({ trig = 'texttt', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, fmta('\\texttt{<>}', { i(1) })),
  s({ trig = 'textsc', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, fmta('\\textsc{<>}', { i(1) })),

  -- Theorem labels
  s({ trig = 'th', regTrig = false, wordTrig = true }, fmta('\\textbf{Theorem:} <>', { i(1) })),
  s({ trig = 'df', regTrig = false, wordTrig = true }, fmta('\\textbf{Definition:} <>', { i(1) })),
  s({ trig = 'pr', regTrig = false, wordTrig = true }, fmta('\\textbf{Proposition:} <>', { i(1) })),
  s({ trig = 'lm', regTrig = false, wordTrig = true }, fmta('\\textbf{Lemma:} <>', { i(1) })),
  s({ trig = 'cr', regTrig = false, wordTrig = true }, fmta('\\textbf{Corollary:} <>', { i(1) })),
  s({ trig = 'prf', regTrig = false, wordTrig = true }, fmta('\\textbf{Proof:} <>', { i(1) })),
  s({ trig = 'rem', regTrig = false, wordTrig = true }, fmta('\\textbf{Remark:} <>', { i(1) })),
  s({ trig = 'ex', regTrig = false, wordTrig = true }, fmta('\\textbf{Example:} <>', { i(1) })),
}
