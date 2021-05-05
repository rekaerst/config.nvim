-- vim options
require('config.vim')

-- nvim-treesitter
require('config.treesitter')

-- nvim-tree
require('config.tree')

-- galaxyline
-- require('config.galaxyline')

-- lualine
require('config.lualine')

-- airline
-- require('config.airline')

-- coc nvim
require('config.coc')

-- misc plugins
vim.g.rainbow_active = 1
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_auto_colors = 0
vim.g.rainbow_conf = {separately = {html = 0}}

