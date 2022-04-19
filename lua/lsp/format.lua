local u = require("core.util")
local autocmd = vim.api.nvim_create_autocmd
local M = {
	disabled = false,
}

local aggressive_ft = { "c", "cpp", "lua", "go", "rust" }

function M._format()
	if M.disabled then
		return
	end

	vim.lsp.buf.formatting_sync()
end

function M.on_attach(client, bufnr)
	autocmd("BufWritePre", { buffer = bufnr, callback = M._format })
	if u.has_value(aggressive_ft, vim.bo.filetype) then
		autocmd("InsertLeave", { buffer = bufnr, callback = M._format })
	end
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
