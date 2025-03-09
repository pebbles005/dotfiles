return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"debugloop/telescope-undo.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		opts = {
			defaults = {
				preview = false,
				layout_config = {
					preview_cutoff = 80,
					preview_width = 0.5,
					height = 0.8,
				},
				file_ignore_patterns = {
					"node_modules",
					"%.git",
				},
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			},
			pickers = {
				find_files = {
					disable_devicons = true,
					hidden = true,
				},
				git_commits = {
					preview = true,
				},
				git_status = {
					preview = true,
				},
				buffers = {
					disable_devicons = true,
				},
				live_grep = {
					disable_devicons = true,
				},
				grep_string = {
					disable_devicons = true,
				},
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local telescope_undo = require("telescope-undo.actions")
			telescope.setup(vim.tbl_deep_extend("force", opts, {
				extensions = {
					undo = {
						mappings = {
							i = {
								["<C-a>"] = telescope_undo.yank_additions,
								["<C-x>"] = telescope_undo.yank_deletions,
								["<C-m>"] = telescope_undo.restore,
							},
							n = {
								["<C-a>"] = telescope_undo.yank_additions,
								["<C-x>"] = telescope_undo.yank_deletions,
								["<C-m>"] = telescope_undo.restore,
							},
						},
					},
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
					},
				},
			}))
			telescope.load_extension("ui-select")
			telescope.load_extension("undo")
			telescope.load_extension("fzf")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })
			vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "git commits" })
			vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "git status" })
			vim.keymap.set({ "n", "v" }, "<leader>fw", function()
				builtin.grep_string({
					word_match = "-w",
				})
			end, { desc = "Search current Word" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search by Grep" })
			vim.keymap.set(
				"n",
				"<leader>/",
				builtin.current_buffer_fuzzy_find,
				{ desc = "Fuzzily search in current buffer" }
			)
			vim.keymap.set("n", "<leader>f/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "Search grep Open Files" })
			vim.keymap.set("n", "<leader>u", ":Telescope undo<CR>", { desc = "Show undotree" })
		end,
	},
}
