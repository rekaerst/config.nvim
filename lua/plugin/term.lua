local Terminal = require("toggleterm.terminal").Terminal
local M = {}

function M.setup()
	require("toggleterm").setup({
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
	})

	function _G.set_terminal_keymaps()
		local opts = { noremap = true }
		vim.api.nvim_buf_set_keymap(0, "t", [[<C-\><C-h>]], [[<C-\><C-n><C-W>h]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", [[<C-\><C-j>]], [[<C-\><C-n><C-W>j]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", [[<C-\><C-k>]], [[<C-\><C-n><C-W>k]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", [[<C-\><C-l>]], [[<C-\><C-n><C-W>l]], opts)
	end

	-- if you only want these mappings for toggle term use term://*toggleterm#* instead
	vim.api.nvim_create_autocmd("TermOpen", {
		pattern = "term://*",
		callback = set_terminal_keymaps,
	})
end
-- custom terminals

-- lazygit
M.lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "single",
	},
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<c-c>", "<cmd>wincmd p<CR>", { noremap = true, silent = true })
		vim.api.nvim_feedkeys("2r", "n", false)
	end,
})

M.dotfiles_lazygit = Terminal:new({
	cmd = "lazygit",
	dir = vim.env.HOME .. "/.local/share/chezmoi",
	direction = "float",
	float_opts = {
		border = "single",
	},
	on_open = function(term)
		os.execute("chezmoi re-add")
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<c-c>", "<cmd>wincmd p<CR>", { noremap = true, silent = true })
		vim.api.nvim_feedkeys("2r", "n", false)
	end,
})

return M
