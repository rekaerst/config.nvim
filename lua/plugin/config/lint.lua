local l = require("lint")

l.linters_by_ft = {
	python = { "flake8", "codespell" },
	c = { "cppcheck", "codespell" },
	cpp = { "cppcheck", "codespell" },
	lua = { "codespell" },
	rust = { "codespell" },
	markdown = { "codespell" },
	text = { "codespell" },
	html = { "codespell" },
	javascript = { "eslint", "codespell" },
}
vim.cmd([[au BufWritePost <buffer> lua require('lint').try_lint()]])
