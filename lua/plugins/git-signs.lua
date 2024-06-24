return {
	"lewis6991/gitsigns.nvim",
	name = "gitsigns.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		-- Movement
		{ "<leader>gj", ":lua require('gitsigns').next_hunk()<cr>",                 mode = { "n" }, desc = "Go to Next Hunk" },
		{ "<leader>gk", ":lua require('gitsigns').prev_hunk()<cr>",                 mode = { "n" }, desc = "Go to Previous Hunk" },
		{ "<leader>gv", ":lua require('gitsigns').select_hunk()<cr>",               mode = { "n" }, desc = "Select Current Hunk" },

		-- Staging and Unstaging
		{ "<leader>gs", ":lua require('gitsigns').stage_hunk()<cr>",                mode = { "n" }, desc = "Stage Hunk" },
		{ "<leader>gS", ":lua require('gitsigns').stage_buffer()<cr>",              mode = { "n" }, desc = "Stage Buffer" },
		{ "<leader>gu", ":lua require('gitsigns').undo_stage_hunk()<cr>",           mode = { "n" }, desc = "Unstage Hunk" },

		-- Resetting
		{ "<leader>gr", ":lua require('gitsigns').reset_hunk()<cr>",                mode = { "n" }, desc = "Reset Hunk" },
		{ "<leader>gR", ":lua require('gitsigns').reset_buffer()<cr>",              mode = { "n" }, desc = "Reset Buffer" },

		-- Previewing
		{ "<leader>gp", ":lua require('gitsigns').preview_hunk()<cr>",              mode = { "n" }, desc = "Preview Hunk" },
		{ "<leader>gP", ":lua require('gitsigns').preview_hunk_inline()<cr>",       mode = { "n" }, desc = "Preview Hunk in File" },

		-- Viewing
		{ "<leader>gh", ":lua require('gitsigns').toggle_linehl()<cr>",             mode = { "n" }, desc = "Toggle Line Hightlight" },
		{ "<leader>gd", ":lua require('gitsigns').toggle_deleted()<cr>",            mode = { "n" }, desc = "Toggle Deleted Hunks" },
		{ "<leader>gc", "<leader>gh<leader>gd",                                     mode = { "n" }, desc = "Toggle Pretty Changes", remap = true },
		{ "<leader>gw", ":lua require('gitsigns').toggle_word_diff()<cr>",          mode = { "n" }, desc = "Toggle Word Diff" },
		{ "<leader>gB", ":lua require('gitsigns').toggle_current_line_blame()<cr>", mode = { "n" }, desc = "Toggle Word Diff" },

		-- Diff
		{ "<space>gD",  ":lua require('gitsigns').diffthis()<cr>",                  mode = { "n" }, desc = "Diff File" },

		-- Blame
		{ "<leader>gb", ":lua require('gitsigns').blame_line({ full = true })<cr>", mode = { "n" }, desc = "Get Blame for Hunk" },
	},

	init = function()
		require("which-key").register({
			g = { name = "Git", },
		}, { prefix = "<leader>", })
	end,

	config = function()
		local opts = {
			numhl = true,
			current_line_blame = true,
			current_line_blame_opts = {
				delay = 0
			}
		}
		require("gitsigns").setup(opts)
	end,
}
