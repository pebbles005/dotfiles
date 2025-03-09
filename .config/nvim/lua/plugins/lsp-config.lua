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
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					local telescope_builtin = require("telescope.builtin")

					map("gd", telescope_builtin.lsp_definitions, "[G]oto [D]efinition")
					map("gr", telescope_builtin.lsp_references, "[G]oto [R]eferences")
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					map("<leader>d", vim.diagnostic.open_float, "Show diagnostics")
					map("<leader>fd", function()
						telescope_builtin.diagnostics({
							bufnr = 0,
						})
					end, "[S]earch [D]iagnostics")

					vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
						border = "single",
					})
					vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
						border = "single",
					})
					vim.diagnostic.config({
						float = { border = "single" },
					})
					require("lspconfig.ui.windows").default_options = {
						border = "single",
					}
				end,
			})
		end,
	},
}
