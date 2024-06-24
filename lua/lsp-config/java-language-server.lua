local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

lspconfig.java_language_server.setup({
	cmd = { "java-language-server" },
	capabilities = capabilities,
})
