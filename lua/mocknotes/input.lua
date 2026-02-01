local M = {}

function M.get_filename(opts, callback)
	opts = opts or {}
	local window = require("mocknotes.window")

	local prompt = opts.prompt or "Filename: "
	local default_ext = opts.default_ext or ".md"

	local buf, win = window.create_float({
		width = opts.width or math.floor(vim.o.columns * 0.4),
		height = 1,
		title = prompt,
	})

	vim.cmd("startinsert")

	vim.keymap.set("i", "<CR>", function()
		local filename = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1]

		vim.api.nvim_win_close(win, true)

		if filename == nil or filename == "" then
			if callback then
				callback(nil)
			end
			return
		end

		local extension = vim.fn.fnamemodify(filename, ":e")
		if extension == "" and default_ext then
			filename = filename .. default_ext
		end

		if callback then
			callback(filename)
		end
	end, { buffer = buf, silent = true })

	vim.keymap.set({ "i", "n" }, "<Esc>", function()
		vim.api.nvim_win_close(win, true)
		if callback then
			callback(nil)
		end
	end, { buffer = buf, silent = true })
end

return M
