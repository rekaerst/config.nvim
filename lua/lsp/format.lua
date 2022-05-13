local M = {
	disabled = false,
}

-- format thoes filetypes on type
local aggressive_ft = { "c", "cpp", "lua", "javascript", "go", "rust" }
-- disable server formatting
local disabled_server = { "sumneko_lua" }

local fmt_group = vim.api.nvim_create_augroup("LspFormatting", {})
---@diagnostic disable-next-line: unused-local
function M.on_attach(client, bufnr)
	-- disable server formatting
	if vim.tbl_contains(disabled_server, client.name) then
		client.server_capabilities.documentFormattingProvider = false
		return
	end
	-- format on save
	vim.api.nvim_clear_autocmds({ group = fmt_group, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = fmt_group,
		buffer = bufnr,
		callback = M.format_sync,
	})
	-- format on type
	if vim.tbl_contains(aggressive_ft, vim.bo.filetype) then
		vim.api.nvim_create_autocmd("InsertLeave", {
			group = fmt_group,
			buffer = bufnr,
			callback = M.format,
		})
	end
end

function M.format()
	if M.disabled or require("luasnip.session").jump_active then
		return
	end
	vim.lsp.buf.format({ async = true })
end

function M.format_sync()
	if M.disabled then
		return
	end
	vim.lsp.buf.format()
end

function M.disable()
	M.disabled = true
end

function M.enable()
	M.disabled = false
end

function M.toggle()
	M.disabled = not M.disabled
end

return M
