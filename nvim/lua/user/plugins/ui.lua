return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},

	-- Panels
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			close_if_last_window = true,
			enable_cursor_hijack = true,
			use_libuv_file_watcher = true,
			source_selector = {
				winbar = true,
				statusline = false,
				show_scrolled_off_parent_node = false,
				sources = {
					{
						source = "filesystem",
						display_name = " 󰉓 Files ",
					},
					{
						source = "buffers",
						display_name = " 󰈚 Buffers",
					},
					{
						source = "git_status",
						display_name = " 󰊢 Git ",
					},
				},
			},
			filesystem = {
				always_show = {
					".config",
					".editorconfig",
					".devcontainer",
				},
				never_show = {
					".DS_Store",
					"thumbs.db",
				},
			},
			git_status = {
				symbols = {
					added = "✚",
					deleted = "✖",
					modified = "",
					renamed = "󰁕",
					-- Status type
					untracked = "",
					ignored = "",
					unstaged = "󰄱",
					staged = "",
					conflict = "",
				},
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "catppuccin",
			},
			extensions = { "neo-tree", "nvim-dap-ui", "trouble" },
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = {
					{
						"diagnostics",
						sources = { "nvim_workspace_diagnostic" },
					},
				},
				lualine_x = { "fileformat", "filetype" },
				lualine_y = {},
				lualine_z = { "location", "searchcount" },
			},
		},
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			cmdline = {
				view = "cmdline",
			},
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = false, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	-- Buffer management
	{
		"mrjones2014/smart-splits.nvim",
		version = "v1.5.*",
	},
	"famiu/bufdelete.nvim",

	-- Code-aware
	{
		"Bekaboo/dropbar.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		config = function()
			local dropbar_api = require("dropbar.api")
			vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
			vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
			vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
		end,
	},
	{ -- Show nested scopes
		"nvim-treesitter/nvim-treesitter-context",
		opts = {},
	},
	{
		"folke/trouble.nvim",
		opts = {
			warn_no_results = false,
			open_no_results = true,
		},
		cmd = "Trouble",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"rmagatti/auto-session",
		opts = {
			lazy_support = true,
			auto_restore = true,
			auto_save = true,
			pre_save_cmds = {
				function()
					require("neo-tree.sources.manager").close_all()
				end,
			},
			suppressed_dirs = { "~/", "~/code", "/", "~/Downloads", "~/Documents", "~/Desktop" },
			use_git_branch = true,
		},
	},
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{ -- scrolling notification view
		"j-hui/fidget.nvim",
		opts = {},
		config = function()
			vim.ui.select = require("fastaction").select
		end,
	},
	{
		"Chaitanyabsprip/fastaction.nvim",
		---@type FastActionConfig
		opts = {},
	},
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {},
	},
	"HiPhish/rainbow-delimiters.nvim",
}
