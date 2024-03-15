return {
	"gbprod/yanky.nvim",
	lazy = true,
	keys = {
		"y",
		{ "p",  "<Plug>(YankyPutAfter)",   mode = { "n", "x" }, desc = "Put after cursor" },
		{ "P",  "<Plug>(YankyPutBefore)",  mode = { "n", "x" }, desc = "Put before cursor" },
		{ "gp", "<Plug>(YankyGPutAfter)",  mode = { "n", "x" }, desc = "Put after cursor and put cursor after" },
		{ "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put before cursor and put cursor after" },
		{
			"<leader>fp",
			":Telescope yank_history<CR>",
			mode = { "n" },
			desc = "Yank Telescope History",
		},
	},

	config = function()
		require("yanky").setup({
			highlight = {
				on_put = true,
				on_yank = true,
				timer = 200,
			},
			ring = {
				history_length = 30,
			},
		})

		require("telescope").load_extension("yank_history")
	end
}
