require("color.base").setup()
require("color.highlight").setup()
vim.cmd("syntax enable")
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")
