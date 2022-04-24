local M = {}

function M.setup()
	require("color.base").setup()
	require("color.highlight").setup()

	-- yank highlight
	local yank_grp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
	vim.api.nvim_create_autocmd("TextYankPost", {
		group = yank_grp,
		callback = function()
			vim.highlight.on_yank({ higroup = "Search", timeout = 150, on_visual = true })
		end,
	})
end

return M
