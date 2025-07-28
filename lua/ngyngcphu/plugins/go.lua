return {
	"ray-x/go.nvim",
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("go").setup({
			-- General settings
			goimports = "gopls", -- if set to 'gopls' will use golsp format
			gofmt = "gopls", -- if set to `gopls` will use golsp format
			max_line_len = 120,
			tag_transform = false,
			test_dir = "",
			comment_placeholder = "   ",
			lsp_cfg = true, -- false: use your own lspconfig
			lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
			lsp_on_attach = true, -- use on_attach from go.nvim
			dap_debug = true,

			-- LSP settings
			lsp_keymaps = true, -- set to false to disable gopls/lsp keymap
			lsp_codelens = true, -- set to false to disable codelens, true by default, you can use a function
			lsp_diag_hdlr = true, -- hook lsp diag handler
			lsp_diag_underline = true,
			lsp_diag_virtual_text = { space = 0, prefix = "" }, -- virtual text setup
			lsp_diag_signs = true,
			lsp_diag_update_in_insert = false,
			lsp_document_formatting = true,
			gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
			gopls_remote_auto = true, -- add -remote=auto to gopls
			gocoverage_sign = "█",
			sign_priority = 5, -- change to a higher number to override other signs
			dap_debug_gui = true, -- set to true to enable dap gui, highly recommend
			dap_debug_init = true, -- see nvim-dap setup
			dap_debug_vt = true, -- see nvim-dap-virtual-text setup
			dap_port = 38697, -- can be set to a number or -1 for random port
			dap_timeout = 15,
			dap_retries = 20,
			build_tags = "tag1,tag2", -- set default build tags
			textobjects = true, -- enable default text objects through treesittter-text-objects
			test_runner = "go", -- one of {`go`, `richgo`, `dlv`, `ginkgo`, `gotestsum`}
			verbose_tests = true, -- set to add verbose flag to tests
			run_in_floaterm = false, -- set to true to run in a float window. :GoTermClose closes the floatterm
			floaterm = { -- position
				posititon = "auto", -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
				width = 0.45, -- width of float window if not auto
				height = 0.98, -- height of float window if not auto
			},
			trouble = true, -- true: use trouble to open quickfix
			test_efm = false, -- errorfomat for quickfix, default mix mode, set to true will be efm only
			luasnip = true, -- enable included luasnip snippets. you can also disable the feature entirely if you don't use luasnip
			-- setup gopls from go.nvim
			on_jobstart = function(cmd)
				_ = cmd
			end,
			on_stdout = function(err, data)
				_, _ = err, data
			end,
			on_stderr = function(err, data)
				_, _ = err, data
			end,
			on_exit = function(code, signal, output)
				_, _, _ = code, signal, output
			end,
		})

		-- Run gofmt + goimports on save
		local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				require("go.format").goimports()
			end,
			group = format_sync_grp,
		})
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
