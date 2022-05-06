local M = {}

function M.rgb(r, g, b)
	return { r = r, g = g, b = b }
end

-- TODO: refactor
-- color.init: color class, methods
-- color.theme: named and base colors data
-- color.highlight: highlight rules
--
-- TODO: migrate to nvim_set_hl
-- TODO: migrate highlight syntax to hl.GroupName = {fg = color, bg = color, ...}
-- use __newindex for creation and __index for update

--- Returns darker color
--- @param f float shade factor
function M.shade(color, f)
	return {
		r = color.r * (1 - f),
		g = color.g * (1 - f),
		b = color.b * (1 - f),
	}
end

--- Returns brighter color
function M.bright(color, f)
	local m = math.max(color.r, color.g, color.b)
	f = (m + (255 - m) * f) / m
	return {
		r = color.r * f,
		g = color.g * f,
		b = color.b * f,
	}
end

--- Returns lighter color
function M.tint(color, f)
	return {
		r = color.r + (255 - color.r) * f,
		g = color.g + (255 - color.g) * f,
		b = color.b + (255 - color.b) * f,
	}
end

function M.hex2rgb(hex)
	hex = hex:gsub("#", "")
	return {
		r = tonumber("0x" .. hex:sub(1, 2)),
		g = tonumber("0x" .. hex:sub(3, 4)),
		b = tonumber("0x" .. hex:sub(5, 6)),
	}
end

function M.rgb2hex(color)
	return string.format("#%x%x%x", color.r, color.g, color.b)
end

function M.setup()
	require("color.base").setup()
	require("color.highlight").setup()

	-- yank highlight
	local yank_grp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
	vim.api.nvim_create_autocmd("TextYankPost", {
		group = yank_grp,
		callback = function()
			vim.highlight.on_yank({ higroup = "Search", timeout = 150, on_visual = true })
		end,
	})
end

return M
