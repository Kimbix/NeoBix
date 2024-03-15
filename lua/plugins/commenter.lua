-- TODO: Setup keybinds for this shit
return {
	"numToStr/Comment.nvim",
	lazy = true,
	keys = { "<leader>cc", "<leader>cC" },

	init = function() -- Keymaps gets registered, but plugin not started, pro
		local api = require("Comment.api")
		local wk = require("which-key")
		wk.register({
			c = {
				name = "Comment",
				c = { api.toggle.linewise.current, "Toggles current line as a comment" },
				C = { api.toggle.blockwise.current, "Toggles current block as a comment" },
			},
		}, { mode = "n", prefix = "<leader>", })
		wk.register({
			c = {
				name = "Comment",
				c = { "<Plug>(comment_toggle_linewise_visual)", "Toggles current line as a comment" },
				C = { "<Plug>(comment_toggle_blockwise_visual)", "Toggles current block as a comment" },
			},
		}, { mode = "x", prefix = "<leader>", })
	end,
	opts = {
		-- Default settings are mostly fine, but if you want to know the defaults, see them at https://github.com/numToStr/Comment.nvim
		mappings = false, -- Don't create mappings, let me do it
	},
}
