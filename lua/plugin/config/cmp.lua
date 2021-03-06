local cmp = require("cmp")
local luasnip = require("luasnip")
local icons = require("lsp").icons

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-l>"] = cmp.mapping(function()
			cmp.close()
			cmp.complete()
		end),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				-- cmp.select_next_item()
				cmp.confirm({ select = true })
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "path", option = { trailing_slash = false } },
		{ name = "buffer" },
		{ name = "emoji" },
		{ name = "latex_symbols" },
	}),
	formatting = {
		---@diagnostic disable-next-line: unused-local
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s ", icons[vim_item.kind])
			vim_item.abbr = string.sub(vim_item.abbr, 1, 64)
			return vim_item
		end,
	},
	-- Do don't allow preselect (for gopls)
	preselect = cmp.PreselectMode.None,
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{
			name = "cmp_git",
		}, -- You can specify the `cmp_git` source if you were installed it.
	}, { {
		name = "buffer",
	} }),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
