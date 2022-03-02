local util = require('utils')
util.nmap('<leader>tt', ':NvimTreeToggle<CR>')
util.nmap('<leader>tr', ':NvimTreeRefresh<CR>')
util.nmap('<leader>tf', ':NvimTreeFindFile<CR>')

require 'nvim-tree'.setup {

}
