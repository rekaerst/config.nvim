require 'config.internals'
require 'config.binding'

require 'lsp_signature'.setup{}
require 'config.cmp'
require 'config.trouble'
require 'lspsaga'.setup{}
require 'fidget'.setup{}
require 'config.lint'

require 'dapui'.setup{}
require "nvim-dap-virtual-text".setup{}

require 'config.lualine'
require 'config.bufferline'

require 'config.indent-blankline'

require 'config.tree'

require 'config.treesitter'
require 'spellsitter'.setup{}
require 'Comment'.setup{}

require 'nvim-ts-autotag'.setup{}
require 'config.autopairs'
require 'config.tabout'
require 'config.whichkey'

require 'config.telescope'

require 'config.octo'
require 'neogit'.setup{}

require 'config.venn'
