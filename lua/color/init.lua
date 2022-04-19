local M = {}

local yankGrp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

function M.setup()
	require("color.base").setup()
	require("color.highlight").setup()

	-- yank highlight
	vim.api.nvim_create_autocmd("TextYankPost", {
		callback = function()
			vim.highlight.on_yank({ higroup = "Search", timeout = 150, on_visual = true })
		end,
		group = yankGrp,
	})
end

return M
