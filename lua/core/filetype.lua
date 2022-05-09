local autocmd = vim.api.nvim_create_autocmd

local M = {}

function M.setup()
	autocmd("TermOpen", { command = "setlocal nonumber" })

	-- tabs --
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

	-- change filetype --
	-- assembly
	autocmd({ "BufNew", "BufNewFile", "BufRead" }, {
		pattern = { "*.s", "*.S", "*.asm", "*.ASM" },
		command = "set ft=nasm",
	})

	-- misc --
	-- enable spell check
	autocmd("FileType", {
		pattern = { "NeogitCommitMessage" },
		command = "setlocal spell",
	})
end

return M
