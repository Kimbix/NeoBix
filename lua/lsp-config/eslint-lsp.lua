local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.eslint.setup({
	capabilities = capabilities,
	filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
	root_dir = util.root_pattern("bun.lockb", "yarn.lock", "lerna.json", ".git"),
})
