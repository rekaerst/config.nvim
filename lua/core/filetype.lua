local autocmd = vim.api.nvim_create_autocmd

local M = {}

function M.setup()
	autocmd("TermOpen", { command = "setlocal nonumber" })

	-- tabs --
	-- expandtab
	autocmd("FileType", {
		pattern = { "python", "markdown", "haskell" },
		command = "setl expandtab",
	})
	-- tabsize = 2
	autocmd("FileType", {
		pattern = { "markdown", "css" },
		command = "setl tabstop=2 | setl shiftwidth=2 | setl softtabstop=2",
	})
	-- tabsize = 8
	autocmd("FileType", {
		pattern = { "nasm", "gas" },
		command = "setl tabstop=8 | setl shiftwidth=8 | setl softtabstop=8",
	})

	-- change filetype --
	-- assembly
	autocmd({ "BufNew", "BufNewFile", "BufRead" }, {
		pattern = { "*.s", "*.S", "*.asm", "*.ASM" },
		command = "set ft=gas",
	})
	-- opencl
	autocmd({ "BufNew", "BufNewFile", "BufRead" }, {
		pattern = { "*.cl" },
		command = "set ft=c",
	})

	-- misc --
	-- enable spell check
	autocmd("FileType", {
		pattern = { "NeogitCommitMessage" },
		command = "setl spell",
	})
	-- open nvimtree if buf is folder
	do
		local count = 0
		local pwd = vim.api.nvim_buf_get_name(0)
		local isdirectory = vim.fn.isdirectory(pwd)
		autocmd("BufEnter", {
			pattern = "*",
			callback = function(c)
				count = count + 1
				if isdirectory == 1 then
					if count == 1 then
						vim.api.nvim_set_current_dir(pwd)
						vim.cmd("NvimTreeToggle")
					else
						-- NOTE: prevent nvimtree at the right side
						vim.cmd([[
							NvimTreeClose
							NvimTreeOpen
							wincmd p
						]])
						vim.api.nvim_del_autocmd(c.id)
					end
				else
					vim.api.nvim_del_autocmd(c.id)
				end
			end,
			desc = "Open NvimTree",
		})
	end
end

return M
