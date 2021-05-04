-- vim options
require('config.vim')

-- nvim-treesitter
require('config.treesitter')

-- nvim-tree
require('config.tree')

-- airline
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g.airline_powerline_fonts = 1
vim.g.airline_section_b = '%{getcwd()}'

-- nvim providers
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- coc nvim
vim.o.backup = false -- some language servers have issues with backup file
vim.o.writebackup = false
vim.o.updatetime = 300 -- having longer updatetime leads to noticeable delays
vim.g.coc_data_home = vim.env.HOME .. '/.local/share/coc'

-- misc plugins
vim.g.rainbow_active = 1
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_auto_colors = 0
vim.g.rainbow_conf = {separately = {html = 0}}

