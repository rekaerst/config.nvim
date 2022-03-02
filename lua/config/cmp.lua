local cmp = require('cmp')

local symbol_map = {
	Text = '',
	Method = '',
	Function = '',
	Constructor = '',
	Field = '',
	Variable = '',
	Class = 'פּ',
	Interface = '',
	Module = '',
	Property = '',
	Unit = 'ﭧ',
	Value = '',
	Enum = '',
	Keyword = '',
	Snippet = '',
	Color = '',
	File = '',
	Folder = '',
	EnumMember = '',
	Constant = '',
	Struct = '',
	Event = '鬒',
	Operator = '',
	TypeParameter = '',
}

cmp.setup({
	snippet = {
		expand = function(args)

			require('luasnip').lsp_expand(args.body)

			-- For `ultisnips` user.
			-- vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
	},
	sources = {
		{ name = 'nvim_lsp' },

		-- For luasnip user.
		{ name = 'luasnip' },

		-- For ultisnips user.
		-- { name = 'ultisnips' },

		{ name = 'path' },
		{ name = 'buffer' },
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = symbol_map[vim_item.kind]
			return vim_item
		end
	}
})
