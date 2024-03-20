return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-ui-select.nvim",
		},

		lazy = true,
		cmd = { "Telescope" },
		keys = {
			-- FILES
			{ "<leader>ff", "<CMD>Telescope find_files<CR>",      mode = { "n", "x" }, desc = "Find files" },
			{ "<leader>fo", "<CMD>Telescope oldfiles<CR>",        mode = { "n", "x" }, desc = "Old files" },
			{ "<leader>fg", "<CMD>Telescope live_grep<CR>",       mode = { "n", "x" }, desc = "Live grep" },
			{ "<leader>f/", "<CMD>Telescope grep_string<CR>",       mode = { "n", "x" }, desc = "Grep string" },

			-- NEOVIM
			{ "<leader>f?", "<CMD>Telescope help_tags<CR>",       mode = { "n", "x" }, desc = "Help search" },
			{ "<leader>fH", "<CMD>Telescope command_history<CR>", mode = { "n", "x" }, desc = "Command history" },
			{ "<leader>f:", "<CMD>Telescope commands<CR>",        mode = { "n", "x" }, desc = "Search commands" },

			-- Git
			{ "<leader>fc", "<CMD>Telescope git_commits<CR>",     mode = { "n", "x" }, desc = "Git commits" },
			{ "<leader>fC", "<CMD>Telescope git_bcommits<CR>",    mode = { "n", "x" }, desc = "Git commits for current buffer" },
			{ "<leader>fb", "<CMD>Telescope git_branches<CR>",    mode = { "n", "x" }, desc = "Git branches" },
			{ "<leader>fG", "<CMD>Telescope git_status<CR>",      mode = { "n", "x" }, desc = "Git branches" },
		},

		init = function()
			require("which-key").register({
				f = { name = "Telescope", },
			}, { prefix = "<leader>", buffer = nil, })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",

		lazy = true,

		config = function()
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"debugloop/telescope-undo.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", },

		lazy = true,
		keys = {
			{ "<leader>fu", "<CMD>Telescope undo<CR>", mode = { "n", "x" }, desc = "Undo history" },
		},

		config = function()
			require("telescope").load_extension("undo")
		end,
	},
}
