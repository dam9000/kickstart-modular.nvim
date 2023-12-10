return {
	"akinsho/nvim-bufferline.lua",
	version = "*",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
	config = function()
		require("bufferline").setup()
	end,
}
