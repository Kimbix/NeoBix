return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- CSharp
				-- null_ls.builtins.formatting.clang_format,
				-- General
				-- null_ls.builtins.formatting.prettier,
				-- require("none-ls.diagnostics.eslint_d"),
				-- null_ls.builtins.diagnostics.eslint,
				--
				-- Lua
				-- null_ls.builtins.formatting.stylua,
				-- Python
				-- null_ls.builtins.formatting.black,
				-- null_ls.builtins.formatting.isort,
				-- GodotScript
				-- null_ls.builtins.formatting.gdformat,
				-- null_ls.builtins.diagnostics.gdlint,
			},
		})
		vim.keymap.set("n", "<leader>lF", vim.lsp.buf.format, {})
	end,
}
