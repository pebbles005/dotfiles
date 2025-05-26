local servers = {
	"bashls",
	"lua_ls",
	"ts_ls",
	"pyright",
	"emmet_ls",
	"svelte",
	"cssls",
	"tailwindcss",
	"jsonls",
	"marksman",
	"html",
	"clangd",
	"eslint",
}
return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {

				ui = {
					border = "single",
					width = 1,
				},
			} },
			"neovim/nvim-lspconfig",
		},
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			require("mason-lspconfig").setup({
				automatic_install = true,
				ensure_installed = servers,
			})
			vim.lsp.enable(servers)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function()
					vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
				end,
			})
		end,
	},
}
