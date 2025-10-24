--setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

--load lazy.nvim plugins
require("lazy").setup(require("lazy-plugins"), {})

--colorscheme configuration
require("tokyonight").setup(require("tokyonight-config"))

--load colorscheme
vim.cmd([[colorscheme tokyonight]])

--enable human readable tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

--enable line numbering
vim.wo.number = true
vim.opt.relativenumber = true

--enable lsp
local lsps = {
	{ "ts_ls" },
	{ "zls" },
	{ "postgres_lsp" },
	{ "clangd", {
		init_options = {
			fallbackFlags = { "--std=c++17" },
		},
	} },
}
--code stolen from https://xnacly.me/posts/2025/neovim-lsp-changes/
--enable all, load a config if there is one
for _, lsp in pairs(lsps) do
	local name, config = lsp[1], lsp[2]
	vim.lsp.enable(name)
	if config then
		vim.lsp.config(name, config)
	end
end

--enable formatters
require("formatter").setup({
	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
		typescript = { require("formatter.filetypes.typescript").prettier },
		typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
		javascript = { require("formatter.filetypes.javascript").prettier },
		javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
		json = { require("formatter.filetypes.json").prettier },
		css = { require("formatter.filetypes.css").prettier },
		html = { require("formatter.filetypes.html").prettier },
		c = { require("formatter.filetypes.c").clangformat },
		cpp = { require("formatter.filetypes.cpp").clangformat },
		zls = { require("formatter.filetypes.zig").zls },
	},
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

--enable diagnostic lines
vim.diagnostic.enable = true
vim.diagnostic.config({
	virtual_lines = true,
})

--enable comment keybind
require("Comment").setup()

--import keybinds
require("keybinds")

--greetings
print("hello you fucking moron")
