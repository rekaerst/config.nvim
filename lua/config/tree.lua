local util = require('utils')
util.nmap('<leader>tt', ':NvimTreeToggle<CR>')
util.nmap('<leader>tr', ':NvimTreeRefresh<CR>')
util.nmap('<leader>tf', ':NvimTreeFindFile<CR>')

vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_ignore = {'.git', 'node_modules'}
vim.g.nvim_tree_hide_dotfiles = 1
