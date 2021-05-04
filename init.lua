-- Installed plugins
require('plugin')

-- LSP (code completion, formating, etc.)
require('lang')

-- DAP (debugging)
require('debug')

-- Key mappings
require('keymap')

-- lagcy vimscript keymap
local util = require('util')
util.source('keymap')

-- Plugin configurations
require('config')

-- Colorscheme and highlighting configurations
require('color')
vim.cmd [[
let @q = '0ivar wwi a A;j'
]]
