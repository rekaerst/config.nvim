local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

npairs.setup({
	check_ts = true,
	enable_check_bracket_line = true,
	fast_wrap = {
		map = "<M-e>",
	},
})

-- insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on(
	"confirm_done",
	cmp_autopairs.on_confirm_done({
		filetypes = {
			tex = false,
			sh = false,
			c = false,
			cpp = false,
			go = false,
			python = false,
			javascript = false,
		},
	})
)

-- arrow key on javascript
npairs.add_rules({
	Rule("%(.*%)%s*%=>$", " {  }", { "typescript", "typescriptreact", "javascript" })
		:use_regex(true)
		:set_end_pair_length(2),
})
