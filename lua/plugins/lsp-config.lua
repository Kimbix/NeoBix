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
				ensure_installed = { "lua_ls", "clangd", "tsserver", "omnisharp" },
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

      local pid = vim.fn.getpid()
			lspconfig.omnisharp.setup({
				cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
				capabilities = capabilities,
			})

			lspconfig.gdscript.setup({
				capabilities = capabilities,
			})
			-- Keybindings
			local builtin = require("telescope.builtin")
			local wk = require("which-key")
			wk.register({
				l = {
					name = "LSP",
					K = { vim.lsp.buf.hover, "Hover Symbol" },
					F = { vim.lsp.buf.format, "Format Document" },
					a = { vim.lsp.buf.code_action, "Code Actions" },
					["<F2>"] = { vim.lsp.buf.rename, "Rename" },
					A = { vim.lsp.buf.add_workspace_folder, "Add Workspace Folder" },
					R = { vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder" },
					L = {
						function()
							print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
						end,
						"List Workspace Folders",
					},

					d = { builtin.lsp_definitions, "LSP Definitions" },
					t = { builtin.lsp_type_definitions, "LSP Type Definitions" },
					s = { builtin.lsp_document_symbols, "LSP Document Symbols" },
					S = { builtin.lsp_workspace_symbols, "LSP Workspace Symbols" },
					["C-s"] = { builtin.lsp_dynamic_workspace_symbols, "LSP Global Symbols" },
					i = { builtin.lsp_implementations, "LSP Implementations" },
					r = { builtin.lsp_references, "LSP References" },
					D = { builtin.diagnostics, "LSP Errors" },
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
	},
}
