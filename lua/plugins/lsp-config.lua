-- Everything related to language servers

return {
	-- For managing the lsps
	{
		"williamboman/mason.nvim",
		lazy = true,
		cmd  = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
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
					"lua_ls",       -- For Lua
					"clangd",		    -- For C and C++
					"omnisharp",    -- For C#
					"tsserver",     -- For TypeScript
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
