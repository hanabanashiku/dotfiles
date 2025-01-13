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
				less = { "prettier" },
				markdown = { "prettier" },
				flow = { "prettier" },
				graphql = { "prettier" },
				scss = { "prettier" },
				json = { "prettier" },
				cs = { "csharpier" },
				go = { "gofmt" },
				sh = { "shfmt" },
				sql = { "sqlfmt" },
			},
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				-- Disable autoformat for files in a certain path
				local bufname = vim.api.nvim_buf_get_name(bufnr)
				if bufname:match("/node_modules/") then
					return
				end
				return { timeout_ms = 500, lsp_format = "fallback" }
			end,
		},
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
	{
		"numToStr/Comment.nvim",
		opts = {
			mappings = {
				basic = false,
				extra = false,
			},
		},
	},
	{
		"nmac427/guess-indent.nvim",
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = "{},",
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
		dependencies = { "rafamadriz/friendly-snippets" },
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
		"seblj/roslyn.nvim",
		ft = "cs",
		opts = {
			config = {
				settings = {
					["csharp|inlay_hints"] = {
						csharp_enable_inlay_hints_for_implicit_object_creation = true,
						csharp_enable_inlay_hints_for_implicit_variable_types = false,
						csharp_enable_inlay_hints_for_lambda_parameter_types = true,
						csharp_enable_inlay_hints_for_types = true,
						dotnet_enable_inlay_hints_for_indexer_parameters = true,
						dotnet_enable_inlay_hints_for_literal_parameters = true,
						dotnet_enable_inlay_hints_for_object_creation_parameters = false,
						dotnet_enable_inlay_hints_for_other_parameters = true,
						dotnet_enable_inlay_hints_for_parameters = false,
						dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
						dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
						dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
					},
					["csharp|code_lens"] = {
						dotnet_enable_references_code_lens = true,
					},
					["csharp|symbol_search"] = {
						dotnet_search_reference_assemblies = true,
					},
				},
			},
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
