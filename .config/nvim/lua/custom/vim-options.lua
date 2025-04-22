vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.o.laststatus = 3
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.nu = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 50
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.inccommand = "split"
vim.o.scrolloff = 5
vim.o.hlsearch = true
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.guicursor = ""
vim.o.timeoutlen = 10000
vim.o.linebreak = true
vim.o.winborder = "single"
vim.diagnostic.config({ virtual_text = true })
vim.o.statusline = " %<%{len(expand('%')) ? expand('%:~:.') : '[No Name]'} %m %=%y %p%% "
vim.cmd.colorscheme("base16")

-- Custom keybinds
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<Esc>", function()
	vim.cmd.fclose()
	vim.cmd.nohlsearch()
end)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<Tab>", function()
	vim.cmd("b#")
	vim.diagnostic.show()
end, { desc = "go to next opened file" })
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "replace the word under the cuursor with another word" }
)
vim.keymap.set("n", "<C-e>", vim.cmd.Oil, { desc = "toggle Oil" })
vim.keymap.set("n", "<leader>j", vim.cmd.cnext)
vim.keymap.set("n", "<leader>k", vim.cmd.cprev)

-- Basic Autocommands
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
