local lspconfig = require("lspconfig")
local format = require("lsp.format")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- TODO: remove this after offset encoding issue is fixed
capabilities.offsetEncoding = { "utf-18" }

require("lsp.null_ls").setup()

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	format.on_attach(client, bufnr)
	require("core.mapping").reg_lsp(bufnr)
end

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

local M = {}

function M.setup()
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
