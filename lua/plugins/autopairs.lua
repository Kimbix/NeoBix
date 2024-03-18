return {
	"windwp/nvim-autopairs",
	lazy = true,
	event = "InsertEnter",

	opts = {
		fast_wrap = {},
		disable_filetype = { "TelescopePrompt", "vim", "neo-tree", "neo-tree-popup" },
	}
}
