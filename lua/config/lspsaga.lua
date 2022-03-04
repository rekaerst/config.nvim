local lspsaga = require 'lspsaga'
lspsaga.setup {}
local utils = require 'utils'
local nmap = utils.nmap
nmap('<space>e', '<cmd>Lspsaga show_line_diagnostics<CR>')
nmap('[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
nmap(']e', '<cmd>Lspsaga diagnostic_jump_next<CR>')
nmap('gh', '<cmd>lua require"lspsaga.provider".lsp_finder()<CR>')
