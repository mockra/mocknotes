local M = {}

function M.yank_to_note()
	local mocknotes = require("mocknotes")
	local selection = require("mocknotes.selection")
	local file = require("mocknotes.file")

	local lines = selection.get_selection()
	local source_filename = vim.fn.expand("%")
	local extension = vim.fn.fnamemodify(source_filename, ":e")

	if lines then
		table.insert(lines, 1, "```" .. extension)
		table.insert(lines, "```")
	end

	local filename = os.date("%Y-%m-%d_%H-%M-%S") .. ".md"
	local filepath = mocknotes.config.directory .. "/quick/" .. filename

	file.create_file({
		content = lines,
		filepath = filepath,
	})
end

return M
