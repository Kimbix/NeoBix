local capabilities = require("cmp_nvim_lsp").capabilities
local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.omnisharp.setup({
	capabilities = capabilities,
	filetypes = { "cs" },
	root_dir = util.root_pattern("*.sln", "*.csproj", "omnisharp.json", "function.json"),
	cmd = { "omnisharp", "-lsp" },
})

-- My omnisharp.json preferred configuration is in this same directory, called omnisharp.lua, move this to the root of the desired directory when creating a new project
