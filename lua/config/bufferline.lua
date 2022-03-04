local u = require "utils"
require'bufferline'.setup {
	options = {
		numbers = function(opts)
			return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
		end,
		diagnostics = "nvim_lsp",
		max_name_length = 20,
		tab_size = 20,
		offsets = {{
			filetype = "NvimTree",
			text = "File Explorer"
		}}
	}
}

u.nmap('gb', '<cmd>BufferLinePick<CR>')
u.nmap(']b', '<cmd>BufferLineCycleNext<CR>')
u.nmap('[b', '<cmd>BufferLineCyclePrev<CR>')
u.nmap('b>>', '<cmd>BufferLineMoveNext<CR>')
u.nmap('b<<', '<cmd>BufferLineMovePrev<CR>')
u.nmap('<leader>bd', '<cmd>bd<cr>')
