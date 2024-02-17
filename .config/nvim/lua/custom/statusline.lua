local function git_branch()
	local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null"):gsub("\n", "")
	if branch == "" then
		return ""
	else
		return " [" .. branch .. "]"
	end
end

local function filepath()
	local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
	if path == "" then
		return "[No Name]"
	end
	return path
end

local function git_diff()
	local git_diff_output =
		vim.fn.system(string.format("git diff --shortstat %s 2>/dev/null", filepath())):gsub("\n", "")
	if git_branch() == "" or git_diff_output == "" then
		return ""
	end
	local diff_list = {}
	local diff_map = {
		files = "~",
		insertions = "+",
		deletions = "-",
	}
	for diff, label in pairs(diff_map) do
		local count = git_diff_output:match("(%d+) " .. diff .. "?")
		if count then
			table.insert(diff_list, string.format("%s%d", label, count))
		end
	end
	return "[" .. table.concat(diff_list, ", ") .. "]"
end

local function file_diagnostics()
	local diagnostics_list = {}
	local severity_map = {
		Error = "E",
		Warn = "W",
		Info = "I",
		Hint = "H",
	}

	for severity, label in pairs(severity_map) do
		local count = vim.tbl_count(vim.diagnostic.get(0, { severity = severity }))
		if count > 0 then
			table.insert(diagnostics_list, string.format("%s:%d", label, count))
		end
	end

	return table.concat(diagnostics_list, " ")
end

local diagnostics_cache = {}
vim.api.nvim_create_autocmd("DiagnosticChanged", {
	group = vim.api.nvim_create_augroup("DiagnosticsUpdate", { clear = true }),
	callback = function()
		local new_diagnostics = file_diagnostics()
		if new_diagnostics ~= diagnostics_cache[vim.api.nvim_get_current_buf()] then
			diagnostics_cache[vim.api.nvim_get_current_buf()] = new_diagnostics
			vim.api.nvim_command("redrawstatus")
		end
	end,
})

function Statusline()
	return table.concat({
		git_branch(),
		"%<" .. filepath() .. (vim.bo.modified and " %m" or ""),
		git_diff(),
		"%=" .. (diagnostics_cache[vim.api.nvim_get_current_buf()] or ""),
		"%y",
		"%p%% ",
	}, " ")
end

vim.o.statusline = "%!v:lua.Statusline()"
