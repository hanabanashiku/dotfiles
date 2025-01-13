return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
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
	},
	{
		"mrjones2014/smart-splits.nvim",
		version = "v1.5.*",
	},
	"famiu/bufdelete.nvim",
	"rcarriga/nvim-notify",
	-- 'HiPhish/rainbow-delimiters.nvim',
	{
		"stevearc/aerial.nvim",
		opts = {},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
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
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"Chaitanyabsprip/fastaction.nvim",
		---@type FastActionConfig
		opts = {},
	},
}
