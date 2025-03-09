return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"prettier",
				"stylua",
				"shfmt",
				"cpplint",
				"clang-format",
				"black",
			},
			run_on_start = true,
			start_delay = 2000,
			debounce_hours = 5,
		},
	},
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				javascript = { "eslint" },
				typescript = { "eslint" },
				javascriptreact = { "eslint" },
				typescriptreact = { "eslint" },
				svelte = { "eslint" },
				cpp = { "cpplint" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		opts = {
			format_on_save = { lsp_format = "fallback" },
			formatters_by_ft = {
				lua = { "stylua" },
				-- svelte = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				python = { "black" },
				json = { "prettier" },
				graphql = { "prettier" },
				java = { "google-java-format" },
				kotlin = { "ktlint" },
				ruby = { "standardrb" },
				markdown = { "prettier" },
				erb = { "htmlbeautifier" },
				html = { "prettier" },
				bash = { "shfmt" },
				proto = { "buf" },
				rust = { "rustfmt" },
				yaml = { "yamlfix" },
				css = { "prettier" },
				scss = { "prettier" },
				cpp = { "clang-format" },
			},
		},
		config = function(_, opts)
			require("conform").setup(opts)
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = { "*.svelte" },
				callback = function()
					vim.lsp.buf.format({ async = true })
				end,
			})
		end,
	},
}
