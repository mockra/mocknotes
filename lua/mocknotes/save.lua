local M = {}

function M.save_all()
	local mocknotes = require("mocknotes")

	local save_message = os.date("Auto save: %Y-%m-%d %H:%M:%S")
	local cmd = string.format(
		"cd %s && git pull --rebase && git add . && git commit -m %s && git push",
		vim.fn.shellescape(mocknotes.config.directory),
		vim.fn.shellescape(save_message)
	)

	vim.system({ "sh", "-c", cmd }, {}, function(obj)
		vim.schedule(function()
			if not obj.code == 0 then
				vim.notify("MockNotes: Failed to save notes:\n" .. obj.stderr, vim.log.levels.ERROR)
			end
		end)
	end)
end

return M
