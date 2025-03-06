return {
	{
		"saghen/blink.cmp",
		event = "LspAttach",
		version = "*",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		opts = {
			keymap = {
				["<C-m>"] = { "accept" },
			},
			completion = {
				menu = {
					border = "single",
					winblend = 0,
					scrollbar = false,
					draw = {
						columns = {
							{ "label", "label_description" },
							{ "kind" },
						},
					},
				},
				documentation = {
					window = {
						border = "single",
						winblend = 0,
						scrollbar = false,
					},
					auto_show = true,
					auto_show_delay_ms = 500,
				},
			},
			snippets = {
				preset = "default",
			},
			sources = {
				providers = {
					snippets = {
						name = "Snippets",
						module = "blink.cmp.sources.snippets",
						opts = {
							search_paths = { "~/.config/nvim/lua/snippets/" },
							extended_filetypes = {
								javascriptreact = { "javascript" },
								typescriptreact = { "javascript" },
								typescript = { "javascript" },
								svelte = { "javascript" },
							},
						},
					},
				},
				default = { "lsp", "snippets", "path", "buffer" },
			},
			cmdline = { enabled = false },
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
}
