local M = {}

function M.create_file(opts)
	opts = opts or {}

	local filepath = opts.filepath
	local content = opts.content

	local window = require("mocknotes.window")

	local buf = vim.api.nvim_create_buf(false, false)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)

	vim.api.nvim_buf_set_name(buf, filepath)
	vim.bo[buf].modified = true

	window.create_float({
		buf = buf,
		width = math.floor(vim.o.columns * 0.8),
		height = math.floor(vim.o.lines * 0.8),
	})
end

return M
