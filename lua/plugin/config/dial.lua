vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
local augend = require("dial.augend")

require("dial.config").augends:register_group({
	-- default augends used when no group name is specified
	default = {
		augend.integer.alias.decimal,
		augend.integer.alias.decimal_int,
		augend.integer.alias.binary,
		augend.integer.alias.octal,
		augend.integer.alias.hex,
		augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
		augend.date.alias["%m/%d/%Y"],
		augend.date.alias["%d/%m/%Y"],
		augend.date.alias["%m/%d"],
		augend.date.alias["%H:%M"],
		augend.semver.alias.semver,
		augend.constant.new({
			elements = { "and", "or" },
			word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
			cyclic = true, -- "or" is incremented into "and".
		}),
		augend.constant.new({
			elements = { "true", "false" },
			word = true,
			cyclic = true,
		}),
		augend.constant.new({
			elements = { "True", "False" },
			word = true,
			cyclic = true,
		}),
		augend.constant.new({
			elements = { "&&", "||" },
			word = false,
			cyclic = true,
		}),
		augend.hexcolor.new({
			case = "lower",
		}),
	},
})
