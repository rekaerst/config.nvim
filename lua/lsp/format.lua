local M = {
	disabled = false,
}

-- format thoes filetypes on type
local aggressive_ft = { "c", "cpp", "lua", "javascript", "go", "rust" }
-- disable server formatting
M.disabled_server = { "sumneko_lua" }

local fmt_group = vim.api.nvim_create_augroup("LspFormatting", {})
local modes = {}
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
		-- NOTE: prevent conflicting with V-BLOCK insertion
		vim.api.nvim_create_autocmd("ModeChanged", {
			group = fmt_group,
			buffer = bufnr,
			callback = function()
				modes[3] = modes[2]
				modes[2] = modes[1]
				modes[1] = vim.api.nvim_get_mode().mode
			end,
		})

		vim.api.nvim_create_autocmd("InsertLeave", {
			group = fmt_group,
			buffer = bufnr,
			callback = M.format,
		})
	end
end

function M.format(async)
	if M.disabled or require("luasnip.session").jump_active or modes[3] == "\22" then
		return
	end
	if async == nil then
		async = true
	end
	if vim.version().api_level >= 10 then
		-- neovim >= 0.8
		vim.lsp.buf.format({
			async = async,
			filter = function(client)
				return not vim.tbl_contains(M.disabled_server, client.name)
			end,
		})
	else
		-- neovim <= 0.7
		if async == nil then
			vim.lsp.buf.formatting()
		else
			---@diagnostic disable-next-line: missing-parameter
			vim.lsp.buf.formatting_sync()
		end
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
