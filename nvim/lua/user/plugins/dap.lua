local function rebuild_project(co, path)
	local spinner = require("easy-dotnet.ui-modules.spinner").new()
	spinner:start_spinner("Building")
	vim.fn.jobstart(string.format("dotnet build %s", path), {
		on_exit = function(_, return_code)
			if return_code == 0 then
				spinner:stop_spinner("Built successfully")
			else
				spinner:stop_spinner("Build failed with exit code " .. return_code, vim.log.levels.ERROR)
				error("Build failed")
			end
			coroutine.resume(co)
		end,
	})
	coroutine.yield()
end

return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dotnet = require("easy-dotnet")
			local debug_dll = nil

			local function ensure_dll()
				if debug_dll ~= nil then
					return debug_dll
				end
				local dll = dotnet.get_debug_dll()
				debug_dll = dll
				return dll
			end

			for _, value in ipairs({ "cs", "fsharp" }) do
				dap.configurations[value] = {
					{
						type = "coreclr",
						name = "launch - netcoredbg",
						request = "launch",
						env = function()
							local dll = ensure_dll()
							local vars = dotnet.get_environment_variables(dll.project_name, dll.relative_project_path)
							return vars or nil
						end,
						program = function()
							local dll = ensure_dll()
							local co = coroutine.running()
							rebuild_project(co, dll.project_path)
							return dll.relative_dll_path
						end,
						cwd = function()
							local dll = ensure_dll()
							return dll.relative_project_path
						end,
					},
				}
			end

			dap.listeners.before["event_terminated"]["easy-dotnet"] = function()
				debug_dll = nil
			end

			dap.adapters.coreclr = {
				type = "executable",
				command = vim.fn.stdpath("data")
					.. "/mason/packages/netcoredbg/netcoredbg"
					.. (vim.fn.has("win32") == 1 and ".exe" or ""),
				args = { "--interpreter=vscode" },
			}
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
		opts = {},
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

