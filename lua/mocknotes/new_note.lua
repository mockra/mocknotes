local M = {}

function M.new_note()
	local mocknotes = require("mocknotes")
	local file = require("mocknotes.file")
	local input = require("mocknotes.input")

	input.get_filename({
		prompt = "New Note",
		default_ext = ".md",
	}, function(filename)
		if not filename then
			return
		end

		local filepath = mocknotes.config.directory .. "/" .. filename

		file.create_file({
			filepath = filepath,
		})
	end)
end

return M
