local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- TODO: remove this after offset encoding issue is fixed
capabilities.offsetEncoding = { "utf-18" }

-- LSP Servers
local servers = {
	"bashls",
	"clangd",
	"cmake",
	"cssls",
	"gdscript",
	"gopls",
	"hls",
	"html",
	"jsonls",
	"jedi_language_server",
	"r_language_server",
	"rust_analyzer",
	"texlab",
	"tsserver",
	"vala_ls",
	"vimls",
}

local M = {}

function M.setup(on_attach)
	-- lua
	-- this ass is too special...
	local luadev = require("lua-dev").setup({
		lspconfig = {
			on_attach = function(client, bufnr)
				client.resolved_capabilities.document_formatting = false
				on_attach(client, bufnr)
			end,
		},
	})

	lspconfig.sumneko_lua.setup(luadev)

	-- setup language servers
	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			on_attach = on_attach,
			debounce_text_changes = 150,
			capabilities = capabilities,
		})
	end

	-- Update diagnostics while inserting
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{ update_in_insert = true }
	)
end

return M
