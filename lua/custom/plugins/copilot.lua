return {
  "zbirenbaum/copilot-cmp",
  dependencies = { "zbirenbaum/copilot.lua", "hrsh7th/nvim-cmp" },
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = false, auto_trigger = false },
      panel = { enabled = false, auto_refresh = true },
      auto_trigger = true,
    })
    require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
  end
}
