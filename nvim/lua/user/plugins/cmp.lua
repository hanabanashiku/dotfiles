return {
	{
		"saghen/blink.cmp",
		dependencies = {
			{
				"Kaiser-Yang/blink-cmp-git",
				dependencies = { "nvim-lua/plenary.nvim" },
			},
		},
		version = "*",

		opts = {
			keymap = {
				preset = "enter",
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

			cmdline = {
				keymap = { preset = "cmdline" },
				completion = {
					menu = { auto_show = true },
					ghost_text = { enabled = false },
					list = {
						selection = {
							preselect = false,
						},
					},
				},
			},

			fuzzy = {
				sorts = {
					"exact",
					"score",
					"sort_text",
				},
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "normal",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "git" },
				providers = {
					git = {
						module = "blink-cmp-git",
						name = "Git",
						opts = {
							-- options for the blink-cmp-git
						},
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
