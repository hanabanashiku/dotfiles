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
	},
}
