local M = {
	disabled = false,
}

-- format thoes filetypes on type
local aggressive_ft = { "c", "cpp", "lua", "javascript", "go", "rust" }
-- disable server formatting
M.disabled_server = { "sumneko_lua" }

local fmt_group = vim.api.nvim_create_augroup("LspFormatting", {})
---@diagnostic disable-next-line: unused-local
function M.on_attach(client, bufnr)
	-- format on save
	vim.api.nvim_clear_autocmds({ group = fmt_group, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = fmt_group,
		buffer = bufnr,
		callback = function()
			M.format(false)
		end,
	})
	-- format on type
	if vim.tbl_contains(aggressive_ft, vim.bo.filetype) then
		vim.api.nvim_create_autocmd("InsertLeave", {
			group = fmt_group,
			buffer = bufnr,
			callback = function()
				vim.defer_fn(M.format, 0) -- HACK: prevent conflict with V-BLOCK
			end,
		})
	end
end

function M.format(async)
	if M.disabled or require("luasnip.session").jump_active then
		return
	end
	if async == nil then
		async = true
	end
	vim.lsp.buf.format({
		async = async,
		filter = function(client)
			return not vim.tbl_contains(M.disabled_server, client.name)
		end,
	})
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
