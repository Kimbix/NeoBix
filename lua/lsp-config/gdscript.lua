local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

lspconfig.gdscript.setup({
	capabilities = capabilities,
})
