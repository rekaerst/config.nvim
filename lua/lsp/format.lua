local autocmd = vim.api.nvim_create_autocmd
local u = require("core.util")

local M = {
	disabled = false,
}

local attached = false

local aggressive_ft = { "c", "cpp", "lua", "go", "rust" }

---@diagnostic disable-next-line: unused-local
function M.on_attach(client, bufnr)
	-- avoid run autocmd multiple times
	if not attached then
		attached = true
		autocmd("BufWritePre", { buffer = bufnr, callback = M.formatting_sync })
		if u.has_value(aggressive_ft, vim.bo.filetype) then
			autocmd("InsertLeave", { buffer = bufnr, callback = M.formatting })
		end
	end
end

function M.formatting()
	if M.disabled then
		return
	end
	vim.lsp.buf.formatting()
end

function M.formatting_sync()
	if M.disabled then
		return
	end
	vim.lsp.buf.formatting_sync()
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
