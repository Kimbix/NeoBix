return {
	"numToStr/Comment.nvim",
	lazy = true,
	keys = {
		{ "<leader>cc", ":lua require('Comment.api').toggle.linewise.current", mode = { "n" }, desc = "Toggle current line as comment" },
		{ "<leader>cC", ":lua require('Comment.api').toggle.blockwise.current", mode = { "n"}, desc = "Toggle current line as comment block" },
		{ "<leader>cc", "<Plug>(comment_toggle_linewise_visual)", mode = { "v" }, desc = "Toggle current line as comment" },
		{ "<leader>cC", "<Plug>(comment_toggle_blockwise_visual)", mode = { "v"}, desc = "Toggle current line as comment block" },
	},

	init = function()
		require("which-key").register({
			c = { name = "Comment", },
		}, { mode = { "n", "v" }, prefix = "<leader>", })
	end,

	opts = {
		-- Default settings are mostly fine, but if you want to know the defaults, see them at https://github.com/numToStr/Comment.nvim
		mappings = false, -- Don't create mappings, let me do it
	},
}
