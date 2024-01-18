-- Everything related to language servers

return {
	-- For managing the lsps
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	-- For comunicating between lsp and mason
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "tsserver" },
			})
		end,
	},
	-- Adds LSP functionality and keybinds to neovim
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

      -- Keybindings
			local wk = require("which-key")
			wk.register({
				l = {
					name = "LSP",
					K = { vim.lsp.buf.hover, "Hover Symbol" },
					F = { vim.lsp.buf.format, "Format Document" },
					a = { vim.lsp.buf.code_actions, "Code Actions" },
					["<F2>"] = { vim.lsp.buf.rename, "Rename" },
				},
				{
					mode = "n",
					prefix = "<leader>",
					buffer = nil,
					silent = true,
					noremap = true,
					nowait = false,
				},
			})
		end,
	},
}
