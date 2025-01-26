local function install_netcoredbg_osx()
	local is_arm64 = vim.fn.system("uname -m"):match("aarch64") ~= nil

	if not is_arm64 then
		return
	end

	local install_path = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg"
	local repo_url = "https://github.com/Samsung/netcoredbg.git"
	local temp = vim.fn.stdpath("data") .. "netcoredbg"

	if vim.fn.isdirectory(install_path) == 1 then
		os.execute(string.format("rm -rf %s", install_path))
	end

	vim.fn.mkdir(install_path, "p")
	vim.fn.mkdir(temp .. "/build", "p")
	os.execute("brew install cmake make")
	os.execute(string.format("git clone %s %s", repo_url, temp))
	vim.fn.chdir(temp .. "/build")
	os.execute("CC=clang CXX=clang++ cmake ..")
	os.execute("make")
	os.execute("make install")
	os.execute(string.format("mv . %s", install_path .. "/"))

	-- Check if the build was successful
	if vim.fn.executable(install_path .. "/netcoredbg") == 1 then
		print("netcoredbg installed successfully.")
	else
		print("Failed to build netcoredbg.")
	end

	---@diagnostic disable-next-line: param-type-mismatch
	vim.fn.chdir(vim.fn.stdpath("data"))
	os.execute(string.format("rm -rf %s", temp))
end

return {
	{
		"mfussenegger/nvim-dap",
		config = function() end,
		build = function()
			install_netcoredbg_osx()
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			ensure_installed = { "coreclr", "chrome-debug-adapter" },
		},
	},
	{ "theHamsta/nvim-dap-virtual-text", opts = {} },
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			{ "mfussenegger/nvim-dap" },
			{ "nvim-neotest/nvim-nio" },
		},
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"Issafalcon/neotest-dotnet",
		},
		config = function(config)
			require("neotest").setup({
				adapters = {
					require("neotest-dotnet")({
						dotnet_additional_args = {
							'--environment DiffEngine_ToolOrder="Neovim,Rider,Vim,VisualStudioCode"',
						},
					}),
				},

				icons = {
					expanded = "",
					child_prefix = "",
					child_indent = "",
					final_child_prefix = "",
					non_collapsible = "",
					collapsed = "",

					passed = "",
					running = "",
					failed = "",
					unknown = "",
				},
			})
		end,
	},
}
