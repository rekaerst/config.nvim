-- vim options
require('config.vim')

-- coc nvim
require('config.coc')

-- nvim-treesitter
require('config.nvim-treesitter')

-- nvim-tree
require('config.nvim-tree')

-- lualine
require('config.lualine')

-- airline
-- require('config.airline')


-- misc plugins
vim.g.rainbow_active = 1
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_auto_colors = 0
vim.g.rainbow_conf = {separately = {html = 0}}

