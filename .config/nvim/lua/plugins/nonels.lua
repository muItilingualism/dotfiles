return {
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					-- Diagnostics
					"markdownlint", -- technically also a formatter

					-- Formatters
					"prettier",
					"stylua",

					-- Deprecated LSPs in none-ls plugin
					"eslint_d",
				},
			})
		end,
		lazy = true,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"jay-babu/mason-null-ls.nvim",
			-- See https://github.com/nvimtools/none-ls.nvim/discussions/81
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local none_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			none_ls.setup({
				sources = {
					none_ls.builtins.formatting.stylua,
					none_ls.builtins.formatting.prettier,

					-- Formatters based-off none-ls-extras
					require("none-ls.code_actions.eslint_d"),
					require("none-ls.diagnostics.eslint_d"),
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						})
					end
				end,
			})

			vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "[F]ormat [F]ile" })
		end,
	},
}
