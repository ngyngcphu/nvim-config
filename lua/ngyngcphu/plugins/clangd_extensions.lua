return {
	"p00f/clangd_extensions.nvim",
		config = function()
		require("clangd_extensions").setup({
			server = {
				cmd = { "clangd", "--background-index", "--clang-tidy" },
				on_attach = function(client, bufnr)
					-- Your existing LSP keybindings and settings
				end,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			},
			extensions = {
				-- Defaults; customize as needed
				autoSetHints = true,
				inlay_hints = {
					show_parameter_hints = true,
					parameter_hints_prefix = "<- ",
					other_hints_prefix = "=> ",
				},
				ast = {
					-- Command for opening AST view (default is "ClangdAst")
					role_icons = {
						type = "🄣",
						declaration = "🄓",
						expression = "🄔",
						statement = ";",
						specifier = "🄢",
						qualifier = "🄠",
						["/"] = "/",
					},
				},
				memory_usage = {
					border = "rounded",
				},
				symbol_info = {
					border = "rounded",
				},
			},
		})
	end,
}
