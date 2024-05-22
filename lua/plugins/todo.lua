return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

	lazy = true,
	event = "BufReadPre",
	cmd = "TodoTelescope",
	keys = {
		{ "<leader>ft", "<CMD>TodoTelescope keywords=TODO,FIX<CR>", mode = { "n", "x" }, desc = "Find Todo" },
	},

	opts = {}
}
