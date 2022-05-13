local lspconfig = require("lspconfig")

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
	"texlab",
	"tsserver",
	"vala_ls",
	"vimls",
	"yamlls",
}

local settings = {
	gopls = {
		staticcheck = true,
	},
}

local single_file_support = {
	bashls = true,
	tsserver = true,
	gopls = true,
	html = true,
	jsonls = true,
	vala_ls = true,
	yamlls = true,
}

local M = {}

M.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- HACK: #428
M.capabilities.offsetEncoding = { "utf-16" }
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
local disabled_server = { "sumneko_lua" }

function M.setup(on_attach)
	-- setup language servers
	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			on_attach = on_attach,
			debounce_text_changes = 150,
			capabilities = M.capabilities,
			single_file_support = single_file_support[lsp] or nil,
			settings = settings,
		})
	end

	-- Update diagnostics while inserting
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{ update_in_insert = true }
	)
end

return M
