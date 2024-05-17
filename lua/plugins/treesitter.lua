return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },

	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "lua", "cpp", "javascript", "c_sharp", "tsx" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
