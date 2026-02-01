local M = {}

function M.yank_to_note()
	local mocknotes = require("mocknotes")
	local selection = require("mocknotes.selection")
	local file = require("mocknotes.file")
	local input = require("mocknotes.input")

	input.get_filename({
		prompt = "New Note",
		default_ext = ".md",
	}, function(filename)
		if not filename or filename == "" then
			filename = os.date("%Y-%m-%d_%H-%M-%S") .. ".md"
		end

		local filepath = mocknotes.config.directory .. "/quick/" .. filename

		local lines = selection.get_selection()
		local source_filename = vim.fn.expand("%")
		local extension = vim.fn.fnamemodify(source_filename, ":e")

		if lines then
			table.insert(lines, 1, "```" .. extension)
			table.insert(lines, "```")
		end

		file.create_file({
			content = lines,
			filepath = filepath,
		})
	end)
end

return M
