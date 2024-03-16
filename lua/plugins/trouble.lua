return {
	"folke/trouble.nvim",
	lazy = true,

	cmd = { "Trouble" },
	keys = {
		{ "<leader>tt", "<CMD>Trouble workspace_diagnostics<CR>", mode = { "n" }, desc = "Open window with workspace diagnostics" },
		{ "<leader>tT", "<CMD>Trouble document_diagnostics<CR>", mode = { "n" }, desc = "Open window with document diagnostics" },
		{ "<leader>tq", "<CMD>Trouble quickfix<CR>", mode = { "n" }, desc = "Open window with quickfix options" },
	},
	opts = { }
}
