local u = require('utils')
u.nmap('<leader>tt', ':NvimTreeToggle<CR>')
u.nmap('<leader>tr', ':NvimTreeRefresh<CR>')
u.nmap('<leader>tf', ':NvimTreeFindFile<CR>')

require'nvim-tree'.setup {}
