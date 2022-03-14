local fg = require("core.util").fg
vim.cmd("syntax enable")
-- Highlight on yank
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")
-- vim.cmd("colorscheme onedark")
-- base16(base16.themes(), true)
require('color.base').setup()
require('color.highlight').setup()
