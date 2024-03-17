local capabilities = require("cmp_nvim_lsp").capabilities
local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.tsserver.setup({
	capabilities = capabilities,
	filetypes = { "typescript" },
	root_dir = util.root_pattern("bun.lockb", "yarn.lock", "lerna.json", ".git"),
})
