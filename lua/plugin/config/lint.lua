local l = require("lint")
l.linters_by_ft = {
	python = { "flake8", "codespell" },
	c = {"codespell"},
	cpp = {"codespell"},
	rust = {"codespell"},
	markdown = { "codespell" },
	text = { "codespell" },
}

vim.cmd([[au BufWritePost <buffer> lua require('lint').try_lint()]])
