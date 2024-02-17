return {
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = true,
		delete_to_trash = true,
		columns = {},
		cleanup_delay_ms = 1000,
		view_options = {
			show_hidden = true,
			natural_order = true,
		},
		win_option = {
			wrap = true,
		},
		keymaps = {
			["<C-e>"] = "actions.close",
			["<C-h>"] = "actions.toggle_hidden",
			["<C-r>"] = "actions.refresh",
			["<C-l>"] = false,
			["<C-s>"] = false,
		},
		keymaps_help = {
			border = "single",
		},
		float = {
			border = "single",
		},
		preview = {
			border = "single",
		},
		ssh = {
			border = "single",
		},
		progress = {
			border = "single",
		},
	},
}
