local function file_exists(name)
	local f = io.open(name, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

local function getCurrentFileDirName()
	local fullPath = vim.fn.expand("%:p:h") -- Get the full path of the directory containing the current file
	local dirName = fullPath:match("([^/\\]+)$") -- Extract the directory name
	return dirName
end

local function get_dll_path()
	local debugPath = vim.fn.expand("%:p:h") .. "/bin/Debug"
	if not file_exists(debugPath) then
		return vim.fn.getcwd()
	end
	local command = 'find "' .. debugPath .. '" -maxdepth 1 -type d -name "*net*" -print -quit'
	local handle = io.popen(command)
	local result = ""
	if handle then
		result = handle:read("*a")
		handle:close()
	end
	result = result:gsub("[\r\n]+$", "") -- Remove trailing newline and carriage return
	if result == "" then
		return debugPath
	else
		local potentialDllPath = result .. "/" .. getCurrentFileDirName() .. ".dll"
		if file_exists(potentialDllPath) then
			return potentialDllPath
		else
			return result == "" and debugPath or result .. "/"
		end
		--        return result .. '/' -- Adds a trailing slash if a net folder is found
	end
end

return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			dap.adapters.coreclr = {
				type = "executable",
				command = vim.fn.stdpath("data")
					.. "/mason/packages/netcoredbg/netcoredbg"
					.. (vim.fn.has("win32") == 1 and ".exe" or ""),
				args = { "--interpreter=vscode" },
			}

			dap.configurations.cs = {
				{
					type = "coreclr",
					name = "NetCoreDbg: Launch",
					request = "launch",
					cwd = "${fileDirName}",
					program = function()
						return vim.fn.input("Pauth to dll", get_dll_path(), "file")
					end,
				},
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
			{
				"marilari88/neotest-vitest",
				branch = "main",
			},
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-dotnet")({
						dap = {
							args = { justMyCode = false },
						},
						discovery_root = "solution",
						dotnet_additional_args = {
							'--environment DiffEngine_ToolOrder="Neovim,Rider,Vim,VisualStudioCode"',
						},
					}),
					require("neotest-vitest"),
				},

				diagnostic = {
					enabled = true,
					severity = 1,
				},
				status = {
					enabled = true,
					virtual_text = true,
					signs = true,
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
