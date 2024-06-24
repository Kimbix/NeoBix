-- Everything related to language servers

return {
	-- For managing the lspslspconfig
	{
		"williamboman/mason.nvim",
		lazy = true,
		cmd  = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = {}
	},

	-- For comunicating between lsp and mason
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
		opts = {}
	},

	-- Adds LSP functionality and keybinds to neovim
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },

		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{ "<leader>lK",     "<CMD>lua vim.lsp.buf.hover()<CR>",         mode = { "n", "x" }, desc = "Hover symbol" },
			{ "<leader>lF",     "<CMD>lua vim.lsp.buf.format()<CR>",        mode = { "n", "x" }, desc = "Format document" },
			{ "<leader>la",     "<CMD>lua vim.lsp.buf.code_action()<CR>",   mode = { "n", "x" }, desc = "Code actions" },
			{ "<leader>lR",     "<CMD>lua vim.lsp.buf.rename()<CR>",        mode = { "n", "x" }, desc = "Rename symbol" },
			{ "<leader>ld",     "<CMD>Telescope lsp_definitions<CR>",       mode = { "n", "x" }, desc = "LSP definitions" },
			{ "<leader>lt",     "<CMD>Telescope lsp_type_definitions<CR>",  mode = { "n", "x" }, desc = "LSP type definitions" },
			{ "<leader>ls",     "<CMD>Telescope lsp_document_symbols<CR>",  mode = { "n", "x" }, desc = "LSP document symbols" },
			{ "<leader>lS",     "<CMD>Telescope lsp_workspace_symbols<CR>", mode = { "n", "x" }, desc = "LSP workspace symbols" },
			{ "<leader>l<C-s>", "<CMD>Telescope lsp_global_symbols<CR>",    mode = { "n", "x" }, desc = "LSP global symbols" },
			{ "<leader>li",     "<CMD>Telescope lsp_implementations<CR>",   mode = { "n", "x" }, desc = "LSP implementations" },
			{ "<leader>lr",     "<CMD>Telescope lsp_references<CR>",        mode = { "n", "x" }, desc = "LSP references" },
		},

		-- TODO: Might add
		-- A = { vim.lsp.buf.add_workspace_folder, "Add Workspace Folder" },
		-- R = { vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder" },
		-- L = {
		-- 	function()
		-- 		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- 	end,
		-- 	"List Workspace Folders",
		-- },

		-- TODO: Might not re-add since trouble does this already
		-- D = { builtin.diagnostics, "LSP Errors" },

		init = function()
			require("which-key").register({
				l = { name = "LSP", },
			}, { mode = "n", prefix = "<leader>", })
		end,

		config = function()
			require("lsp-config.clangd")
			require("lsp-config.lua-lsp")
			require("lsp-config.eslint-lsp")
			require("lsp-config.tsserver")
			require("lsp-config.rust-analyzer")
			require("lsp-config.omnisharp")
			require("lsp-config.svelte")
			require("lsp-config.cssls")
			require("lsp-config.nil-ls")
			require("lsp-config.gdscript")
			require("lsp-config.java-language-server")
		end,
	}
}
