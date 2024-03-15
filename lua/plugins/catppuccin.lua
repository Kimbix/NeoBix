return {
	"catppuccin/nvim",
	name = "Catppuccin",
	priority = 1000,
	config = function()
    vim.cmd("set termguicolors")
    vim.cmd("set t_Co=256")
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
