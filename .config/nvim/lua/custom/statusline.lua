local function filepath()
	local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
	if path == "" then
		return "[No Name]"
	end
	return path
end

function Statusline()
	return table.concat({
		" %<" .. filepath() .. (vim.bo.modified and " %m" or ""),
		"%=" .. vim.bo.filetype,
		"%p%% ",
	}, " ")
end

vim.o.statusline = "%!v:lua.Statusline()"
