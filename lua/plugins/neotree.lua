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
				e = { "<CMD>Neotree filesystem toggle left focus <CR>", "Toggle Neotree" },
				E = { "<CMD>Neotree filesystem reveal left focus <CR>", "Focus Neotree" },
				g = { "<CMD>Neotree git_status reveal left focus <CR>", "Git Status Tree" },
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
