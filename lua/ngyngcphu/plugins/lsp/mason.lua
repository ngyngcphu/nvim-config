return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")

		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"gopls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"pyright", -- Python language server
				"black", -- Python formatter
				"isort", -- Python import sorter
				"pylint", -- Python linter
				{ "eslint_d", version = "13.1.2" },
				"gopls",
				"delve",
				"gofumpt",
				"goimports",
				"golines",
				"golangci-lint",
				"gotests",
				"impl",
				"gomodifytags",
				"protols",
				"swiftlint",
			},
		})
	end,
}
