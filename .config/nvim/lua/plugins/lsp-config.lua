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
		"williamboman/mason.nvim",
		opts = {
			ui = {
				border = "single",
				width = 1,
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		opts = {
			automatic_installation = true,
			ensure_installed = servers,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					capabilities = capabilities,
				})
			end
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function()
					vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
				end,
			})
		end,
	},
}
