- [Intro](#intro)
- [Snippet template](#snippet-template)
- [Nodes](#nodes)
  - [text node](#text-node)
  - [insert node](#insert-node)
  - [fmt()](#fmt)

## Intro

Configuration za `luasnip` imaš v `nvim/lua/kickstart/plugins/cmp.lua`, pomemben
je line, kjer je required directory za snippet (load_... nekaj).

    return {
      { -- Autocompletion
        ...
          ...
            ...
              ...
                config = function()
                  require('luasnip.loaders.from_vscode').lazy_load()
                  require('luasnip.loaders.from_lua').load { paths = { 'C:/Users/joene/AppData/Local/nvim/snippets/' } }
              end,
            ...
          ...
        ...
      },
    }

## Snippet template

    local ls = require('luasnip')
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node

    return {
      s(
        { -- Table 1: parameters
          trig = 'hello',
          dscr = "spremeni 'hello' v 'Hello world'",
        }, 

        { -- Table 2: nodes
          t("Hello world")
        },

        { -- Table 3: advanced parameters }
      )
    }

## Nodes

### text node

Imaš one-liner.

    "hello"

in multi-liner:

    [[
      to je multi line,
      zato lahko pises z
      line breaks :)
    ]]

### insert node

Kam ti prleti cursor v snipetu. Za skakanje levo in desno se uporabljata `<Plug>luasnip-jump-next` in `<Plug>luasnip-jump-prev`.
[Več lah prebereš tuki](https://ejmastnak.com/tutorials/vim-latex/luasnip/#keymaps).

### fmt()

    s({
      ...
      }, fmt()
    )

basically...

    fmt(
      `tuki pride snippet replacement`,
      { `tuki pridejo nodes` },
      { `tuki pridejo delimiters` }
    )

Delimiter je znak, ki se uporabi za placanje cursorja.

#### primer fmt() uporabe

```
s({
  trig = "halo",
  dscr = "neki",
  }, fmt(
  [[
    moje ime: <>
    moj priimek: <>
  ]], 
  { 
    i(1, 'ime'),
    i(2, 'priimek')
  }, 
  { delimiters = '<>' }
  )
)
```

`fmta` je samo fmt, le da so delimiters nastimani na `<>` po default.
