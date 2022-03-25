local lspconfig = require("lspconfig")
local lspformat = require("lsp-format")
lspformat.setup({})

local reg = require("core.mapping").reg_lsp
require("lsp.ui")

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	lspformat.on_attach(client)
	vim.cmd([[autocmd InsertLeave <buffer> lua require'lsp-format'.format()]])
	reg(bufnr)
end
-- LSP Servers
local servers = {
	"pylsp",
	"rust_analyzer",
	"clangd",
	"gopls",
	"hls",
	"r_language_server",
	"tsserver",
	"html",
	"jsonls",
	"cssls",
	"bashls",
	"gdscript",
	"cmake",
	"vala_ls",
	"vimls",
	"sqls",
}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		debounce_text_changes = 150,
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	})
end

-- lua
-- this ass is too special...
local luadev = require("lua-dev").setup({
	lspconfig = {
		on_attach = on_attach,
	},
})
lspconfig.sumneko_lua.setup(luadev)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = {
		spacing = 5,
		severity_limit = "Warning",
	},
	update_in_insert = true,
})
