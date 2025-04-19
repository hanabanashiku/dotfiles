return {
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.8",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"bin",
					"obj",
					".cache",
					".parcel_cache",
					".git",
					".idea",
					".DS_Store",
				},
			},
		},
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files({
						hidden = true,
						no_ignore = false,
					})
				end,
				desc = "Find files",
			},
			{
				"<leader>fw",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Find words",
			},
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Find buffers",
			},
			{
				"<leader>fo",
				function()
					require("telescope.builtin").oldfiles()
				end,
				desc = "Find history",
			},
			{
				"<leader>fk",
				function()
					require("telescope.builtin").keymaps()
				end,
				desc = "Find keymaps",
			},
			{
				"<leader>gt",
				function()
					require("telescope.builtin").git_status()
				end,
				desc = "Git status",
			},
			{
				"<leader>gc",
				function()
					require("telescope.builtin").git_commits()
				end,
				desc = "Git commits",
			},
			{
				"<leader>gf",
				function()
					require("telescope.builtin").git_files()
				end,
				desc = "Git files",
			},
			{
				"<leader>gb",
				function()
					require("telescope.builtin").git_branches()
				end,
				desc = "Git branches",
			},
		},
	},
}
