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
			filesystem = {
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

	-- Buffer management
	{
		"mrjones2014/smart-splits.nvim",
		version = "v1.5.*",
	},
	"famiu/bufdelete.nvim",

	-- Code-aware
	{ -- breadcrumbs
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
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
