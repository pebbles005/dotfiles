return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gm", ":Gvdiffsplit!<CR>")
			-- fetch changes from branch merging to
			vim.keymap.set("n", "gh", ":diffget //2<CR>")
			-- fetch changes from branch merging from
			vim.keymap.set("n", "gl", ":diffget //3<CR>")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },

				changedelete = { text = "~" },
			},
		},
	},
}
