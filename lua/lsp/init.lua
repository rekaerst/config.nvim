local fmt = require("lsp.format")

local signdef = vim.fn.sign_define

local M = {}

function M.on_attach(client, bufnr)
	vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
	require("core.mapping").reg_lsp(bufnr)
	if client.supports_method("textDocument/formatting") then
		fmt.on_attach(client, bufnr)
	end
end

M.icons = {
	Class = "פּ",
	Color = "",
	Constant = "",
	Constructor = "",
	Enum = "",
	EnumMember = "",
	Event = "鬒",
	Field = "",
	File = "",
	Folder = "",
	Function = "",
	Interface = "",
	Keyword = "",
	Method = "",
	Module = "",
	Operator = "",
	Property = "",
	Reference = "",
	Snippet = "",
	Struct = "",
	Text = "",
	TypeParameter = "",
	Unit = "ﭧ",
	Value = "",
	Variable = "",
}

function M.setup()
	signdef("DiagnosticSignError", {
		text = "",
		texthl = "DiagnosticError",
	})
	signdef("DiagnosticSignWarn", {
		text = "",
		texthl = "DiagnosticWarn",
	})
	signdef("DiagnosticSignHint", {
		text = "",
		texthl = "DiagnosticHint",
	})
	signdef("DiagnosticSignInfo", {
		text = "",
		texthl = "DiagnosticInfo",
	})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "single",
	})
	local kinds = vim.lsp.protocol.CompletionItemKind
	for i, kind in ipairs(kinds) do
		kinds[i] = M.icons[kind] or kind
	end

	require("lsp.server").setup(M.on_attach)
	require("lsp.null_ls").setup(M.on_attach)
end

return M
