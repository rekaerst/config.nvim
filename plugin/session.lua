local autocmd = vim.api.nvim_create_autocmd

autocmd("SessionLoadPost", {
	callback = function()
		-- for lazy loading nvim-tree to works with mksession
		local bufinfo = vim.fn.getbufinfo()
		for _, v in pairs(bufinfo) do
			if string.find(v.name, "NvimTree") then
				vim.cmd("NvimTreeOpen")
				vim.cmd("wincmd p")
				break
			end
		end
		vim.cmd("set cmdheight=1")
	end,
})
