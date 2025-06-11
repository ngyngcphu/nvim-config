local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "ngyngcphu.plugins" }, { import = "ngyngcphu.plugins.lsp" } }, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("ClangdExtensions", {}),
	callback = function(args)
		local bufnr = args.buf
		local opts = { buffer = bufnr, silent = true, noremap = true }
		local keymap = vim.keymap.set

		-- Add bindings for extensions
		keymap("n", "<leader>ce", "<cmd>ClangdAst<CR>", opts) -- View AST
		keymap("n", "<leader>cm", "<cmd>ClangdMemoryUsage<CR>", opts) -- View memory usage
		keymap("n", "<leader>cs", "<cmd>ClangdSymbolInfo<CR>", opts) -- View symbol info
	end,
})
