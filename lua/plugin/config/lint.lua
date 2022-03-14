local l = require("lint")
l.linters_by_ft = {
	python = { "flake8", "cspell" },
	markdown = { "cspell" },
	text = { "cspell" },
}

vim.cmd([[au BufWritePost <buffer> lua require('lint').try_lint()]])
