local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

lspconfig.nil_ls.setup({
	capabilities = capabilities
})
