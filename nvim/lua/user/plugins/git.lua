return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
		keys = {
			{
				"<leader>gj",
				function()
					require("gitsigns").nav_hunk("next")
				end,
				desc = "Next hunk",
			},
			{
				"<leader>gk",
				function()
					require("gitsigns").nav_hunk("prev")
				end,
				desc = "Previous hunk",
			},
			{
				"<leader>gB",
				function()
					require("gitsigns").blame_line()
				end,
				desc = "Blame line",
			},
			{
				"<leader>gp",
				function()
					require("gitsigns").preview_hunk()
				end,
				desc = "Preview hunk",
			},
			{
				"<leader>gr",
				function()
					require("gitsigns").reset_hunk()
				end,
				desc = "Reset hunk",
			},
			{
				"<leader>gR",
				function()
					require("gitsigns").reset_buffer()
				end,
				desc = "Reset buffer",
			},
			{
				"<leader>gs",
				function()
					require("gitsigns").stage_hunk()
				end,
				desc = "Stage hunk",
			},
			{
				"<leader>gd",
				function()
					require("gitsigns").diffthis()
				end,
				desc = "Diff this",
			},
		},
	},
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = true,
		opts = {
			default_mappings = false,
		},
		keys = {
			{
				"<leader>gc",
				"<cmd>GitConflictListQf<cr>",
				desc = "List conflicts",
			},
			{
				"co",
				"<Plug>(git-conflict-ours)",
				desc = "Choose ours",
			},
			{
				"ct",
				"<Plug>(git-conflict-theirs)",
				desc = "Choose theirs",
			},
			{
				"cb",
				"<Plug>(git-conflict-both)",
				desc = "Choose both",
			},
			{
				"c0",
				"<Plug>(git-conflict-none)",
				desc = "Choose none",
			},
			{
				"[x",
				"<Plug>(git-conflict-prev-conflict)",
				desc = "Previous conflict",
			},
			{
				"]x",
				"<Plug>(git-conflict-next-conflict)",
				desc = "Next conflict",
			},
		},
	},
	"tpope/vim-fugitive",
}
