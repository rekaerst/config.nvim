local fmt = require("lsp.format")
local c = require("color.highlight").colors
local cmp_auto_refresh = require("plugin.cmp").auto_refresh

local signdef = vim.fn.sign_define

local M = {}

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
	vim.diagnostic.config({
		update_in_insert = true,
		float = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = "rounded",
			source = "always",
			prefix = " ",
			scope = "cursor",
		},
	})

	require("lsp.server").setup(M.on_attach)
	require("lsp.null_ls").setup(function(client, bufnr)
		require("core.mapping").reg_lsp(bufnr)
		fmt.on_attach(client, bufnr)
	end)
end

function M.on_attach(client, bufnr)
	vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
	require("core.mapping").reg_lsp(bufnr)
	-- formatting
	if client.supports_method("textDocument/formatting") then
		fmt.on_attach(client, bufnr)
	end

	M._auto_open_diagnostic_window(bufnr)
	M._highlight_symbols_under_cursor(client, bufnr)
	cmp_auto_refresh(client, bufnr)
end

function M._auto_open_diagnostic_window(bufnr)
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			vim.diagnostic.open_float()
		end,
	})
end

function M._highlight_symbols_under_cursor(client, bufnr)
	if client.server_capabilities.documentHighlightProvider then
		vim.highlight.create("LspReferenceRead", { guibg = c.one_bg3 }, false)
		vim.highlight.create("LspReferenceText", { guibg = c.one_bg3 }, false)
		vim.highlight.create("LspReferenceWrite", { guibg = c.one_bg3 }, false)
		vim.api.nvim_create_augroup("lsp_document_highlight", {
			clear = false,
		})
		vim.api.nvim_clear_autocmds({
			buffer = bufnr,
			group = "lsp_document_highlight",
		})
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end
end

return M
