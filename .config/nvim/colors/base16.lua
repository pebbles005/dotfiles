local colors = {
	base00 = "#191919", -- Default Background
	base01 = "#282828", -- Lighter Background (Used for status bars, line number and folding marks)
	base02 = "#383838", -- Selection Background
	base03 = "#7F8487", -- Comments, Invisibles, Line Highlighting
	base04 = "#b8b8b8", -- Dark Foreground (Used for status bars)
	base05 = "#DBDBDB", -- Default Foreground, Caret, Delimiters, Operators
	base06 = "#e8e8e8", -- Light Foreground (Not often used)
	base07 = "#f8f8f8", -- Light Background (Not often used)
	base08 = "#E6B2BA", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
	base09 = "#dbbc7f", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
	base0A = "#dbbc7f", -- Classes, Markup Bold, Search Text Background
	base0B = "#99bbaa", -- Strings, Inherited Class, Markup Code
	base0C = "#81A1C1", -- Support, Regular Expressions, Escape Characters, Markup Quotes
	base0D = "#7fbbb3", -- Functions, Methods, Attribute IDs, Headings
	base0E = "#E6B2BA", -- Keywords, Storage, Selector, Markup Italic, Diff Changed
	base0F = "#a16946", -- Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
}

vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight NormalFloat guibg=NONE ctermbg=NONE")

local function highlight(group, fg, bg)
	local fg_color = fg and "guifg=" .. fg or ""
	local bg_color = bg and "guibg=" .. bg or ""
	vim.cmd("highlight " .. group .. " " .. fg_color .. " " .. bg_color)
end

highlight("Normal", colors.base05, "NONE")
highlight("Visual", "NONE", colors.base02)
highlight("Comment", colors.base03, "NONE")
highlight("LineNr", colors.base04, "NONE")
highlight("Keyword", colors.base0E, "NONE")
highlight("Function", colors.base0C, "NONE")
highlight("String", colors.base0B, "NONE")
highlight("Constant", colors.base09, "NONE")
highlight("Type", colors.base0A, "NONE")
highlight("Statement", colors.base08, "NONE")
highlight("@property", colors.base0D, "NONE")
highlight("StatusLine", colors.base00, colors.base0B)
highlight("VertSplit", colors.base05, "NONE")
highlight("Pmenu", colors.base03, "NONE")
highlight("PmenuSel", colors.base0B, colors.base00)
highlight("OilDir", colors.base0D, "NONE")
return colors
