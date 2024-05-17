local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

lspconfig.svelte.setup({
	capabilities = capabilities,
})
