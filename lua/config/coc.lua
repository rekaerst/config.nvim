util = require('utils')
vim.g.coc_data_home = vim.env.HOME .. '/.local/share/coc'
require('compe').setup{
	enabled = false
}
require('lspsaga').
vim.lsp.stop_client(vim.lsp.get_active_clients())
util.source('config/coc')
