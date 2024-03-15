return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local wk = require("which-key")
		wk.register({
			e = {
				name = "NeoTree",

				-- Not much needed here tbh
				E = { "<CMD>Neotree filesystem toggle float focus <CR>", "Toggle Neotree" },
				b = { "<CMD>Neotree buffers toggle float focus<CR>", "Toggle Active Buffers" },
				e = { "<CMD>Neotree filesystem reveal float focus <CR>", "Focus Neotree" },
				g = { "<CMD>Neotree git_status reveal float focus <CR>", "Git Status Tree" },
			},
		}, {
			mode = "n",
			prefix = "<leader>",
			buffer = nil,
			silent = true,
			noremap = true,
			nowait = false,
		})
	end,
}
