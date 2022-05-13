local luadev = require("lua-dev").setup({
	lspconfig = {
		on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			require("lsp").on_attach(client, bufnr)
		end,
	},
})

require("lspconfig").sumneko_lua.setup(luadev)
