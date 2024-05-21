return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			globalstatus = true,
			options = { theme = "dracula" },
		})
	end,
}
