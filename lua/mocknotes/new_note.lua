local M = {}

function M.new_note()
	local mocknotes = require("mocknotes")
	local file = require("mocknotes.file")
	local window = require("mocknotes.window")

	local buf, win = window.create_float({
		width = math.floor(vim.o.columns * 0.2),
		height = 1,
	})

	vim.cmd("startinsert")

	vim.keymap.set("i", "<CR>", function()
		local filename = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1]

		vim.api.nvim_win_close(win, true)

		local extension = vim.fn.fnamemodify(filename, ":e")
		if extension == "" then
			filename = filename .. ".md"
		end

		local filepath = mocknotes.config.directory .. "/" .. filename

		file.create_file({
			filepath = filepath,
		})
	end, { buffer = buf, silent = true })

	vim.keymap.set({ "i", "n" }, "<Esc>", function()
		vim.api.nvim_win_close(win, true)
	end, { buffer = buf, silent = true })
end

return M
