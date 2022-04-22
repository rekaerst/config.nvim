require("dressing").setup({
	select = {
		backend = { "builtin" },
		get_config = function(opt)
			if opt.kind == "codeaction" then
				return {
					backend = "builtin",
					builtin = {
						relative = "cursor",
						min_height = { 1, 0 },
					},
				}
			end
		end,
	},
})
