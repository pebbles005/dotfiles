return {
	"ibhagwan/fzf-lua",
	opts = {
		winopts = {
			prompt = "MyPrompt> ", -- Set
			height = 0.60, -- window height
			width = 0.80, -- window width
			border = "single",
			backdrop = 100,
			title_flags = false, -- uncomment to disable title flags
			preview = {
				border = "single", -- preview border: accepts both `nvim_open_win`
				hidden = true, -- start preview hidden
				layout = "horizontal", -- horizontal|vertical|flex
				scrollbar = false, -- `false` or string:'float|border'
				winopts = { -- builtin previewer window options
					number = false,
				},
			},
		},

		fzf_opts = {
			["--layout"] = "default",
			["--margin"] = "2%",
		},
	},
	config = function(_, opts)
		local fzf = require("fzf-lua")
		fzf.setup(opts)
		vim.keymap.set("n", "<leader>ff", fzf.files)
		vim.keymap.set("n", "<leader><leader>", fzf.buffers)
		vim.keymap.set("n", "<leader>fg", fzf.live_grep_native)
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("fzf-lsp-attach", { clear = true }),
			callback = function()
				vim.keymap.set("n", "<leader>fd", fzf.diagnostics_document)
				vim.keymap.set("n", "gd", fzf.lsp_typedefs)
				vim.keymap.set("n", "grr", fzf.lsp_references)
				vim.keymap.set("n", "gri", fzf.lsp_implementations)
				vim.keymap.set("n", "gra", fzf.lsp_code_actions)
			end,
		})
	end,
}
