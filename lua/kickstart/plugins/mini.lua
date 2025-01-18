-- [[ Collection of various small independent plugins/modules ]]

return {
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    -- Examples:
    --   va)  - [V]isually select [A]round [)]paren
    --   yin' - [Y]ank [I]nside [N]ext [']quote
    --   ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    -- Examples:
    --   saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    --   sd'   - [S]urround [D]elete [']quotes
    --   sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Better navigation and manipulation of the file system
    vim.keymap.set('n', '<leader>em', ':lua MiniFiles.open()<CR>', { desc = 'Open [M]ini File Explorer' })
    require('mini.files').setup {
      mappings = {
        go_in = 'L',
        go_in_plus = '',
        go_out = 'H',
        go_out_plus = '',
      },
    }

    -- Auto-pairs for quotes, brackets, etc.
    require('mini.pairs').setup()

    -- Go to the next/previous element with square brackets.
    require('mini.bracketed').setup()
  end,
}

-- vim: ts=2 sts=2 sw=2 et
