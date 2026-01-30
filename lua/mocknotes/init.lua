local M = {}

M.config = {}

-- Initialize plugin
function M.setup(opts)
	opts = opts or {}

	local noteDirectory = vim.fn.expand(opts.directory)
	local gitRepo = opts.git_repo

	if not noteDirectory or not gitRepo then
		vim.notify(
			"MockNotes: Please set 'mocknotes_directory' and 'mocknotes_git_repo' in your vim configuration.",
			vim.log.levels.ERROR
		)
		return
	end

	if vim.fn.isdirectory(noteDirectory) == 0 then
		vim.notify("Cloning notes repository...", vim.log.levels.INFO)
		local cmd = string.format("git clone %s %s", vim.fn.shellescape(gitRepo), vim.fn.shellescape(noteDirectory))
		local result = vim.fn.system(cmd)

		if vim.v.shell_error ~= 0 then
			vim.notify("Failed to clone repository: " .. result, vim.log.levels.ERROR)
			return
		end

		vim.notify("Repository cloned successfully", vim.log.levels.INFO)
	end

	M.config = {
		directory = noteDirectory,
		git_repo = gitRepo,
	}
end

return M
