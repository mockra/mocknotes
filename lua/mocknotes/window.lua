local M = {}

function M.create_float(opts)
	opts = opts or {}

	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)
	local title = opts.title or ""
	local buf = opts.buf or vim.api.nvim_create_buf(false, true)

	local win_opts = {
		relative = "editor",
		width = width,
		height = height,
		col = math.floor((vim.o.columns - width) / 2),
		row = math.floor((vim.o.lines - height) / 2),
		style = "minimal",
		border = "rounded",
	}

	if title ~= "" then
		win_opts.title = " " .. title .. " "
		win_opts.title_pos = "center"
	end

	local win = vim.api.nvim_open_win(buf, true, win_opts)

	return buf, win
end

return M
