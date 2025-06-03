-- Highlight todo, notes, etc in comments
return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = false,
      gui_style = {
        fg = 'NONE', -- The gui style to use for the fg highlight group.
        bg = 'NONE', -- The gui style to use for the bg highlight group.
      },
      highlight = {
        multiline = false, -- enable multine todo comments
        keyword = 'wide', -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = 'fg', -- "fg" or "bg" or empty
        comments_only = true, -- uses treesitter to match keywords in comments only
        exclude = {}, -- list of file types to exclude highlighting
      },
      colors = {
        generic = { '#828282' },
      },
      keywords = {
        NOTE = { color = 'generic' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
