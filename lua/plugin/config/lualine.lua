local colors = require("color.highlight").colors
local filename = require("lualine.components.filename"):extend()
local highlight = require("lualine.highlight")

local mode_map = {
	["n"] = "NORMAL",
	["no"] = "O-PENDING",
	["nov"] = "O-PENDING",
	["noV"] = "O-PENDING",
	["no\22"] = "O-PENDING",
	["niI"] = "N-INSERT",
	["niR"] = "N-REPLACE",
	["niV"] = "N-VISUAL",
	["nt"] = "NORMAL",
	["v"] = "VISUAL",
	["vs"] = "VISUAL",
	["V"] = "V-LINE",
	["Vs"] = "V-LINE",
	["\22"] = "V-BLOCK",
	["\22s"] = "V-BLOCK",
	["s"] = "SELECT",
	["S"] = "S-LINE",
	["\19"] = "S-BLOCK",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["ix"] = "INSERT",
	["R"] = "REPLACE",
	["Rc"] = "REPLACE",
	["Rx"] = "REPLACE",
	["Rv"] = "V-REPLACE",
	["Rvc"] = "V-REPLACE",
	["Rvx"] = "V-REPLACE",
	["c"] = "COMMAND",
	["cv"] = "EX",
	["ce"] = "EX",
	["r"] = "REPLACE",
	["rm"] = "MORE",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERMINAL",
}

-- Changing filename color based on modified status
local default_status_colors = { saved = colors.nord_blue, modified = colors.pink }

function filename:init(options)
	filename.super.init(self, options)
	self.status_colors = {
		saved = highlight.create_component_highlight_group(
			{ fg = default_status_colors.saved },
			"filename_status_saved",
			self.options
		),
		modified = highlight.create_component_highlight_group(
			{ fg = default_status_colors.modified },
			"filename_status_modified",
			self.options
		),
	}
	if self.options.color == nil then
		self.options.color = ""
	end
end

function filename:update_status()
	local data = filename.super.update_status(self)
	data = highlight.component_format_highlight(
		vim.bo.modified and self.status_colors.modified or self.status_colors.saved
	) .. data
	return data
end

--- @param trunc_width number trunctates component when screen width is less then trunc_width
--- @param trunc_len number truncates component to trunc_len number of chars
--- @param hide_width number hides component when window width is smaller then hide_width
--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
--- return function that can format the component accordingly
local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
	return function(str)
		local win_width = vim.fn.winwidth(0)
		if hide_width and win_width < hide_width then
			return ""
		elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
			return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
		end
		return str
	end
end

-- diffview file panel
local diffview_ext = {
	sections = {
		lualine_a = {
			function()
				return "DiffView"
			end,
		},
	},
	filetypes = { "DiffviewFiles" },
}

local help_ext = {
	sections = {
		lualine_a = {
			function()
				return "Help"
			end,
		},
		lualine_y = {
			function()
				return vim.api.nvim_buf_line_count(0)
			end,
		},
		lualine_z = { "progress" },
	},
	filetypes = { "help" },
}

local function mode()
	return mode_map[vim.api.nvim_get_mode().mode] or "__"
end

require("lualine").setup({
	sections = {
		lualine_a = { { mode, fmt = trunc(80, 4, nil, true) } },
		lualine_b = {
			{ "branch" },
			{ "diff", fmt = trunc(nil, nil, 65, true) },
			{ "diagnostics" },
		},
		lualine_c = { filename },
		lualine_x = {
			{ "encoding", fmt = trunc(nil, nil, 78, true) },
			{ "fileformat", fmt = trunc(nil, nil, 78, true) },
			{ "filetype" },
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	options = {
		theme = {
			normal = {
				a = { bg = colors.green, fg = colors.black, gui = "bold" },
				b = { bg = colors.one_bg3, fg = colors.white },
				c = { bg = colors.statusline_bg, fg = colors.light_grey },
			},
			insert = {
				a = { bg = colors.blue, fg = colors.black, gui = "bold" },
			},
			visual = {
				a = { bg = colors.dark_purple, fg = colors.black, gui = "bold" },
			},
			replace = {
				a = { bg = colors.red, fg = colors.black, gui = "bold" },
			},
			command = {
				a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
			},
			inactive = {
				a = { bg = colors.one_bg3, fg = colors.white },
			},
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	extensions = { "nvim-tree", "toggleterm", "symbols-outline", "quickfix", diffview_ext, help_ext, "nvim-dap-ui" },
})
