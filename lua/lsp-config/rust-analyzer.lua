local capabilities = require("cmp_nvim_lsp").capabilities
local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	filetypes = { "rust" },
	root_dir = util.root_pattern("Cargo.toml"),

	settings = {
		['rust-analyzer'] = {
			cargo = {
				allFeatures = true,
			}
		}
	}
})
