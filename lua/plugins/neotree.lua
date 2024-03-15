return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},

	lazy = true,
	keys = {
		{
			"<leader>ee",
			"<CMD>Neotree filesystem toggle float focus<CR>",
			mode = { "n", "x" },
			desc = "Toggle Files Neotree",
		},
		{
			"<leader>eb",
			"<CMD>Neotree buffers toggle float focus<CR>",
			mode = { "n", "x" },
			desc = "Toggle Buffers Neotree",
		},
		{
			"<leader>eg",
			"<CMD>Neotree git_status toggle float focus<CR>",
			mode = { "n", "x" },
			desc = "Toggle Git Status Neotree",
		},
	},

	init = function()
		require("which-key").register({
			e = { name = "NeoTree" },
		}, { mode = { "n", "x" }, prefix = "<leader>" })
	end,
}
