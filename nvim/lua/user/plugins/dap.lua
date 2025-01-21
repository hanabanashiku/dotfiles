return {
	"mfussenegger/nvim-dap",
	"jay-babu/mason-nvim-dap.nvim",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			{ "mfussenegger/nvim-dap" },
			{ "nvim-neotest/nvim-nio" },
		},
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		opts = {},
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "marilari88/neotest-vitest" },
			{ "nvim-neotest/neotest-jest" },
			{ "nvim-neotest/neotest-python" },
			{ "Issafalcon/neotest-dotnet" },
		},
	},
	{
		"mxsdev/nvim-dap-vscode-js",
		dependencies = { { "mfussenegger/nvim-dap" } },
	},
	"mfussenegger/nvim-dap-python",
	{
		"microsoft/vscode-js-debug",
		lazy = true,
		build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	},
}

