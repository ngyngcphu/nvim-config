return {
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		config = function()
			require("flutter-tools").setup({
				ui = {
					border = "rounded",
					notification_style = "native",
				},
				decorations = {
					statusline = {
						app_version = false,
						device = false,
						project_config = false,
					},
				},
				debugger = {
					enabled = false,
				},
				flutter_path = nil,
				flutter_lookup_cmd = nil,
				root_patterns = { ".git", "pubspec.yaml" },
				fvm = false,
				widget_guides = {
					enabled = false,
				},
				closing_tags = {
					highlight = "ErrorMsg",
					prefix = ">",
					enabled = true,
				},
				dev_log = {
					enabled = true,
					notify_errors = false,
					open_cmd = "tabedit",
				},
				dev_tools = {
					autostart = false,
					auto_open_browser = false,
				},
				outline = {
					open_cmd = "30vnew",
					auto_open = false,
				},
				lsp = {
					color = {
						enabled = false,
						background = false,
						background_color = nil,
						foreground = false,
						virtual_text = true,
						virtual_text_str = "■",
					},
					on_attach = function(_, _) end,
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
					settings = {
						showTodos = true,
						completeFunctionCalls = true,
						analysisExcludedFolders = {
							vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
							vim.fn.expand("$HOME/.pub-cache"),
							vim.fn.expand("/opt/homebrew"),
							vim.fn.expand("$HOME/tools/flutter"),
						},
						renameFilesWithClasses = "prompt",
						enableSnippets = true,
						updateImportsOnRename = true,
					},
				},
			})

			local keymap = vim.keymap
			keymap.set("n", "<leader>Fo", "<cmd>FlutterOutlineToggle<cr>", { desc = "Toggle Flutter Outline" })
			keymap.set("n", "<leader>Fr", "<cmd>FlutterRun<cr>", { desc = "Flutter Run" })
			keymap.set("n", "<leader>Fq", "<cmd>FlutterQuit<cr>", { desc = "Flutter Quit" })
			keymap.set("n", "<leader>Fd", "<cmd>FlutterDevices<cr>", { desc = "Flutter Devices" })
			keymap.set("n", "<leader>Fe", "<cmd>FlutterEmulators<cr>", { desc = "Flutter Emulators" })
			keymap.set("n", "<leader>FR", "<cmd>FlutterReload<cr>", { desc = "Flutter Hot Reload" })
			keymap.set("n", "<leader>FS", "<cmd>FlutterRestart<cr>", { desc = "Flutter Hot Restart" })
			keymap.set("n", "<leader>Fl", "<cmd>FlutterLogClear<cr>", { desc = "Flutter Clear Logs" })
			keymap.set("n", "<leader>Ft", "<cmd>FlutterDevTools<cr>", { desc = "Flutter Dev Tools" })
		end,
	},
}
