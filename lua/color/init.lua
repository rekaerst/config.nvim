require("color.base").setup()
require("color.highlight").setup()
vim.cmd("syntax enable")

vim.cmd([[au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}]])
