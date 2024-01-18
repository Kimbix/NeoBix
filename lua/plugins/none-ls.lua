return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
        -- General
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.eslint_d,
        -- Lua
				null_ls.builtins.formatting.stylua,
        -- Python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
			},
		})
		vim.keymap.set("n", "<leader>lF", vim.lsp.buf.format, {})
	end,
}
