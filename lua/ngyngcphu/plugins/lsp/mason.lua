return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")
		-- enable mason and configure icons
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
			-- list of servers for mason to install
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
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint", -- python linter
				{ "eslint_d", version = "13.1.2" }, -- js linter
				-- Go tools
				"gopls", -- Go language server
				"delve", -- Go debugger
				"gofumpt", -- Go formatter (stricter than gofmt)
				"goimports", -- Go imports formatter
				"golines", -- Go line length formatter
				"golangci-lint", -- Go linter
				"gotests", -- Go test generator
				"impl", -- Go interface implementation generator
				"gomodifytags", -- Go struct tag modifier
				"protols",
			},
		})
	end,
}
