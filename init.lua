if vim.env.VIRTUAL_ENV then
	local venv_bin = vim.env.VIRTUAL_ENV .. "/bin"
	vim.g.python3_host_prog = venv_bin .. "/python"
	vim.env.PATH = venv_bin .. ":" .. vim.env.PATH
end

require("ngyngcphu.core")
require("ngyngcphu.lazy")

-- Add cargo bin to PATH for Neovim
vim.env.PATH = vim.env.PATH .. ":/Users/lap60627/.cargo/bin"
