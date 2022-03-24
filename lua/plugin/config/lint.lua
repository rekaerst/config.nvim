local l = require("lint")
l.linters_by_ft = {
	python = { "flake8", "codespell" },
	c = { "cppcheck", "codespell" },
	cpp = { "cppcheck", "codespell" },
	rust = { "codespell" },
	markdown = { "codespell" },
	text = { "codespell" },
	html = { "tidy" },
	javascript = { "eslint" }
}

vim.cmd([[au BufWritePost <buffer> lua require('lint').try_lint()]])
