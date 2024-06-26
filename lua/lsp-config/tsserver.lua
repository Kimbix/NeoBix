local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.tsserver.setup({
	capabilities = capabilities,
	filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
	root_dir = util.root_pattern("bun.lockb", "yarn.lock", "lerna.json", ".git"),
	cmd = { "typescript-language-server", "--stdio" }
})
