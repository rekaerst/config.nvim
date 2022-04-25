local autocmd = vim.api.nvim_create_autocmd

local M = {}

function M.setup()
	autocmd("TermOpen", { command = "setlocal nonumber" })
	-- expandtab
	autocmd("FileType", {
		pattern = { "python", "markdown" },
		command = "set expandtab",
	})
	-- tabsize = 2
	autocmd("FileType", {
		pattern = { "markdown", "css" },
		command = "set tabstop=2 | set shiftwidth=2 | set softtabstop=4",
	})
	-- tabsize = 8
	autocmd("FileType", {
		pattern = { "nasm" },
		command = "set tabstop=8 | set shiftwidth=8 | set softtabstop=8",
	})
	-- force filetype
	autocmd({ "BufNew", "BufNewFile", "BufRead" }, {
		pattern = { "*.s", "*.S", "*.asm", "*.ASM" },
		command = "set ft=nasm",
	})
end

return M
