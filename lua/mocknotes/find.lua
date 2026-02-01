local M = {}
function M.find_note_fzf()
	local mocknotes = require("mocknotes")
	local directory = mocknotes.config.directory

	vim.cmd(string.format("Files %s", vim.fn.fnameescape(directory)))
end

return M
