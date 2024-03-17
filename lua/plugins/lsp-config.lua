-- Everything related to language servers

return {
	-- For managing the lsps
	{
		"williamboman/mason.nvim",
		lazy   = true,
		cmd    = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		config = function()
			require("mason").setup()
		end,
	},

	-- For comunicating between lsp and mason
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,

		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",  -- For Lua
					"clangd",  -- For C and C++
					"omnisharp", -- For C#
					"tsserver", -- For TypeScript
					"rust_analyzer" -- Rust Analyzer
				},
			})
		end,
	},

	-- Adds LSP functionality and keybinds to neovim
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },

		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{ "<leader>lK",     "<CMD>lua vim.lsp.buf.hover()<CR>",       mode = { "n", "x" }, desc = "Hover symbol" },
			{ "<leader>lF",     "<CMD>lua vim.lsp.buf.format()<CR>",      mode = { "n", "x" }, desc = "Format document" },
			{ "<leader>la",     "<CMD>lua vim.lsp.buf.code_action()<CR>", mode = { "n", "x" }, desc = "Code actions" },
			{ "<leader>lR",     "<CMD>lua vim.lsp.buf.rename()<CR>",      mode = { "n", "x" }, desc = "Rename symbol" },
			{ "<leader>ld",     "<CMD>Telescope lsp_definitions<CR>",     mode = { "n", "x" }, desc = "LSP definitions" },
			{ "<leader>lt",     "<CMD>Telescope lsp_type_definitions",    mode = { "n", "x" }, desc = "LSP type definitions" },
			{ "<leader>ls",     "<CMD>Telescope lsp_document_symbols",    mode = { "n", "x" }, desc = "LSP document symbols" },
			{ "<leader>lS",     "<CMD>Telescope lsp_workspace_symbols",   mode = { "n", "x" }, desc = "LSP workspace symbols" },
			{ "<leader>l<C-s>", "<CMD>Telescope lsp_global_symbols",      mode = { "n", "x" }, desc = "LSP global symbols" },
			{ "<leader>li",     "<CMD>Telescope lsp_implementations",     mode = { "n", "x" }, desc = "LSP implementations" },
			{ "<leader>lr",     "<CMD>Telescope lsp_references",          mode = { "n", "x" }, desc = "LSP references" },
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
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

			require("lsp-config.tsserver")
			require("lsp-config.rust-analyzer")

			require("lspconfig").omnisharp.setup({
				cmd = { "omnisharp" },

				-- Enables support for reading code style, naming convention and analyzer
				-- settings from .editorconfig.
				enable_editorconfig_support = true,

				-- If true, MSBuild project system will only load projects for files that
				-- were opened in the editor. This setting is useful for big C# codebases
				-- and allows for faster initialization of code navigation features only
				-- for projects that are relevant to code that is being edited. With this
				-- setting enabled OmniSharp may load fewer projects and may thus display
				-- incomplete reference lists for symbols.
				enable_ms_build_load_projects_on_demand = false,

				-- Enables support for roslyn analyzers, code fixes and rulesets.
				enable_roslyn_analyzers = false,

				-- Specifies whether 'using' directives should be grouped and sorted during
				-- document formatting.
				organize_imports_on_format = false,

				-- Enables support for showing unimported types and unimported extension
				-- methods in completion lists. When committed, the appropriate using
				-- directive will be added at the top of the current file. This option can
				-- have a negative impact on initial completion responsiveness,
				-- particularly for the first few completion sessions after opening a
				-- solution.
				enable_import_completion = false,

				-- Specifies whether to include preview versions of the .NET SDK when
				-- determining which version to use for project loading.
				sdk_include_prereleases = true,

				-- Only run analyzers against open files when 'enableRoslynAnalyzers' is
				-- true
				analyze_open_documents_only = false,
			})

			lspconfig.gdscript.setup({
				capabilities = capabilities,
			})
		end,
	},
}
