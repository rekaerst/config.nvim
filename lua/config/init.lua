require('config.vim')
-- require('config.coc')
require('config.nvim-treesitter')
require('config.nvim-tree')
require('config.lualine')
-- require('config.airline')
require('gitsigns').setup()
-- require('nvim-autopairs').setup()
require('config.compe')
require('config.lightbulb')

-- rainbow indent
vim.g.rainbow_active = 1
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_auto_colors = 0
vim.g.rainbow_conf = {separately = {html = 0}}

