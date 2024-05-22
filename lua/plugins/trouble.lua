return {
	"folke/trouble.nvim",
	lazy = true,

	cmd = { "Trouble" },
	keys = {
		{ "<leader>do", vim.diagnostic.open_float, mode = { "n" }, desc = "Open error message floating" },
		{ "<leader>dj", vim.diagnostic.goto_next, mode = { "n" }, desc = "Goto next diagnostic" },
		{ "<leader>dk", vim.diagnostic.goto_prev, mode = { "n" }, desc = "Goto prev diagnostic" },
		{ "<leader>dD", "<CMD>Trouble workspace_diagnostics<CR>", mode = { "n" }, desc = "Open window with workspace diagnostics" },
		{ "<leader>dd", "<CMD>Trouble document_diagnostics<CR>", mode = { "n" }, desc = "Open window with document diagnostics" },
		{ "<leader>dq", "<CMD>Trouble quickfix<CR>", mode = { "n" }, desc = "Open window with quickfix options" },
		{ "<leader>dl", "<CMD>Trouble loclist<CR>", mode = { "n" }, desc = "Open loclist" },
	},

	init = function()
		require("which-key").register({
			d = { name = "Trouble", },
		}, { mode = "n", prefix = "<leader>", })
	end,

	opts = { }
}
