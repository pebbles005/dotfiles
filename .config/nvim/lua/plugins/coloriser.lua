return {
	"NvChad/nvim-colorizer.lua",
	event = "VeryLazy",
	config = function(_, opts)
		local colorizer = require("colorizer")
		colorizer.setup(opts)
		vim.defer_fn(function()
			colorizer.attach_to_buffer(0)
		end, 0)
	end,
}
