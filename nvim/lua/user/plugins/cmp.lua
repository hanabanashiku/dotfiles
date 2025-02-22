return {
	{
		"saghen/blink.compat",
		version = "*",
		lazy = true,
		opts = {},
		config = function()
			require("blink.compat.registry").register_source(
				"easy-dotnet",
				require("easy-dotnet").package_completion_source
			)
		end,
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			{
				"Kaiser-Yang/blink-cmp-git",
				dependencies = { "nvim-lua/plenary.nvim" },
			},
		},
		version = "*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "enter",
				["<S-k>"] = { "show_signature" },
				["<C-k>"] = { "fallback" },
				["<Esc>"] = { "hide_signature", "fallback" },
			},

			completion = {
				list = {
					selection = {
						preselect = true,
					},
				},
				ghost_text = { enabled = false },
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "normal",
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer", "git", "easy-dotnet" },
				providers = {
					git = {
						module = "blink-cmp-git",
						name = "Git",
						opts = {},
					},
					["easy-dotnet"] = {
						name = "DotNet",
						module = "blink.compat.source",
					},
				},
			},
			snippets = { preset = "luasnip" },
			signature = {
				enabled = true,
			},
		},
		opts_extend = { "sources.default" },
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	{
		"echasnovski/mini.pairs",
		version = "*",
		opts = {},
	},
	{
		"nmac427/guess-indent.nvim",
		opts = {},
	},
}
