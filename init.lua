local present, impatient = pcall(require, "impatient")
if present then
	impatient.enable_profile()
end

local modules = {
	"plugin",
	"core.mapping",
	"core.util",
	"core.internal",
	"core.commands",
	"lsp",
	"dbg",
	"color",
}

for _, module in ipairs(modules) do
	local ok, err = pcall(require, module)
	if not ok then
		error("Error loading " .. module .. "\n\n" .. err)
	end
end
