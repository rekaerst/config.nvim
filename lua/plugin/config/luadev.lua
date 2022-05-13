local luadev = require("lua-dev").setup({
	lspconfig = {
		on_attach = require("lsp").on_attach,
	},
})

require("lspconfig").sumneko_lua.setup(luadev)
