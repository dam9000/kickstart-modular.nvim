vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeFindFileToggle)
vim.keymap.set("n", "<leader>r", vim.cmd.NvimTreeRefresh)

return {
  "kyazdani42/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
  end,
}
