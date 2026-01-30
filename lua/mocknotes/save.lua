local M = {}

function M.save_all()
	local mocknotes = require("mocknotes")

	local save_message = os.date("Auto save: %Y-%m-%d %H:%M:%S")
	local cmd = string.format(
		"cd %s && git pull --rebase && git add . && git commit -m %s && git push",
		vim.fn.shellescape(mocknotes.config.directory),
		vim.fn.shellescape(save_message)
	)
	local result = vim.fn.system(cmd)

	if vim.v.shell_error ~= 0 then
		vim.notify("MockNotes: Failed to auto save notes:\n" .. result, vim.log.levels.ERROR)
	end
end

return M
