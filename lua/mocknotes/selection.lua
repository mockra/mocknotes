local M = {}

function M.get_selection()
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")
	local lines = vim.fn.getline(start_pos[2], end_pos[2])

	if type(lines) ~= "table" or #lines == 0 then
		return {}
	end

	if #lines == 1 then
		lines[1] = string.sub(lines[1], start_pos[3], end_pos[3])
	else
		lines[1] = string.sub(lines[1], start_pos[3])
		lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
	end

	return lines
end

return M
