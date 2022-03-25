require("formatter").setup({
	filetype = {
		lua = {
			function()
				return {
					exe = "stylua",
					args = { "-" },
					stdin = true,
				}
			end,
		},
	},
})
