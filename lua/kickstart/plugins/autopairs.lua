-- [[ Configure autopairs for brackets ]]

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {
    -- Use treesitter to configure which filetypes and symbols not to add pairs.
    -- check_ts = true, -- enable treesitter
    -- ts_config = {
    --   lua = { "string" },
    --   javascript = { "template_string" },
    -- }
  },
  config = function(_, opts)
    require('nvim-autopairs').setup(opts)
    -- If you want to automatically add `(` after selecting a function or method
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}

-- vim: ts=2 sts=2 sw=2 et
