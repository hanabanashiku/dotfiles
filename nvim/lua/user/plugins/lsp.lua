return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"nvim-treesitter/nvim-treesitter-context",
	"rmagatti/goto-preview",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"petertriho/cmp-git",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	"onsails/lspkind.nvim",
	"b0o/schemastore.nvim",
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				lua = { "stylua" },
				kt = { "ktfmt" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier", "rustywind" },
				svelte = { "prettier", "rustywind" },
				html = { "prettier", "rustywind" },
				css = { "prettier" },
				json = { "prettier" },
				cs = { "csharpier" },
				go = { "gofmt" },
				sh = { "shfmt" },
				sql = { "sqlfmt" },
			},
			format_on_save = {
				timeout_ms = 500,
			},
		},
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	{
		"nmac427/guess-indent.nvim",
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter", "CmdlineEnter" },
		config = true,
		opts = {},
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
	},

	-- Language specific
	"windwp/nvim-ts-autotag",
	{
		"luckasRanarison/tailwind-tools.nvim",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
			"neovim/nvim-lspconfig", -- optional
		},
	},

	{
		"iamcco/markdown-preview.nvim",
		enabled = vim.fn.executable("npm") == 1,
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.g.mkdp_auto_close = 0
			vim.g.mkdp_command_for_global = 1
			vim.g.mkdp_combine_preview = 1

			local function load_then_exec(cmd)
				return function()
					vim.cmd.delcommand(cmd)
					require("lazy").load({ plugins = { "markdown-preview.nvim" } })
					vim.api.nvim_exec_autocmds("BufEnter", {}) -- commands appear only after BufEnter
					vim.cmd(cmd)
				end
			end

			---Fixes "No command :MarkdownPreview"
			---https://github.com/iamcco/markdown-preview.nvim/issues/585#issuecomment-1724859362
			for _, cmd in pairs({ "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" }) do
				vim.api.nvim_create_user_command(cmd, load_then_exec(cmd), {})
			end
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				"neotest",
				"nvim-dap-ui",
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	{ -- optional completion source for require statements and module annotations
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
		end,
	},
}
