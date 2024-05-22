return {
	"catppuccin/nvim",
	name = "Catppuccin",
	priority = 1000,
	init = function()
		require("catppuccin").setup({
			flavour = "mocha",
			background = {
				light = "latte",
				dark = "mocha"
			},
			transparent_background = false,
			show_end_of_buffer = true,
			term_colors = false,
			dim_inactive = {
				enabled = true,
				shade = "dark",
				percentage = 0.25
			},
			no_italic = false,
			no_bold = false,
			no_underline = false,
			styles = {            -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = { "bold" },
				functions = { "bold" },
				keywords = { "bold" },
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = { "bold" },
				operators = {},
			},
			color_overrides = {},
			custom_highlights = {},
			default_integrations = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			}
		})
		vim.cmd.colorscheme "catppuccin"
	end,
}
