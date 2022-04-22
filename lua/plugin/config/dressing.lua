require("dressing").setup({
	input = {
		winblend = 0,
	},
	select = {
		backend = { "builtin" },

		builtin = {
			winblend = 0,
		},

		get_config = function(opt)
			if opt.kind == "codeaction" then
				return {
					backend = "builtin",
					builtin = {
						relative = "cursor",
						min_height = { 1, 0 },
						winblend = 0,
					},
				}
			end
		end,
	},
})
