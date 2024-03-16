-- [[ Configure autopairs for brackets ]]

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = true,
  opts = {
    -- Use treesitter to configure when not to add pairs.
    -- check_ts = true, -- enable treesitter
    -- ts_config = {
    --   lua = { "string" }, -- don't add pairs in lua string treesitter nodes
    --   javascript = { "template_string" }, -- don't add pairs in javascript template_string
    -- }
  },
}

-- vim: ts=2 sts=2 sw=2 et
