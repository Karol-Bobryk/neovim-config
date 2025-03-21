local lazyPlugins = {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"dundalek/lazy-lsp.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
			"hrsh7th/cmp-nvim-lsp",
			{
				"hrsh7th/nvim-cmp",
				opts = function(_, opts)
					local cmp = require("cmp")
					local cmp_action = require("lsp-zero").cmp_action()
					cmp.setup({
						mapping = cmp.mapping.preset.insert({
							["<CR>"] = cmp.mapping.confirm({ select = false }),
						}),
					})
				end,
			},
			config = function()
				local lsp_zero = require("lsp-zero")
				lsp_zero.on_attach(function(client, bufnr)
					lsp_zero.default_keymaps({
						buffer = bufnr,
					})
				end)
				require("lazy-lsp").setup({})
			end,
		},
	},
	{ "mhartington/formatter.nvim" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"c",
					"cpp",
					"css",
					"json",
					"make",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"elixir",
					"heex",
					"javascript",
					"html",
					"typescript",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
}
return lazyPlugins
