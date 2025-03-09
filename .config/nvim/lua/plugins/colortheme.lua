return {
	{
		"rmehri01/onenord.nvim",
		opts = {
			theme = nil,
			borders = true,
			styles = {
				comments = "italic",
				diagnostics = "underline",
			},
			disable = {
				background = true,
				float_background = true,
				cursorline = true,
				eob_lines = true,
			},
		},
		config = function(_, opts)
			require("onenord").setup(opts)
			vim.cmd.colorscheme("onenord")
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = "VeryLazy",
		config = function(_, opts)
			local colorizer = require("colorizer")
			colorizer.setup(opts)
			vim.defer_fn(function()
				colorizer.attach_to_buffer(0)
			end, 0)
		end,
	},
}
