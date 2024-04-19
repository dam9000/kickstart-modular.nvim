return {
   'laytan/cloak.nvim',
   config = function()
      require('cloak').setup({
         enabled = true, -- enable cloaking feature
         cloak_character = '*',
         highlight_group = 'Comment', -- use comment highlight group for cloaked text
         patterns = {
            {
               file_pattern = {
                  '.env*',
                  'wrangler.toml',
                  '.dev.vars',
               }, -- match any file starting with ".env"
               cloak_pattern = '=.+', -- match an equals sign and any character after it for the cloaking pattern
            },
         },
      })
   end,

   vim.keymap.set('n', '\\c', ':CloakToggle<cr>', { desc = 'Toggle [C]loaking' }),
}
