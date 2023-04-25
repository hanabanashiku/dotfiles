local dap = require 'dap'
local masonDap = require 'mason-nvim-dap'

masonDap.setup {
    ensure_installed = { 'coreclr', 'lldb' },
    handlers = {
        function(config)
            masonDap.default_setup(config)
        end,

        coreclr = function(config)
            config.adapters = {
                type = 'executable',
                command = 'netcoredbg',
                args = { '--interpreter=vscode' }
            }

            config.configurations.cs = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
                    end
                }
            }
            masonDap.default_setup(config)
        end,

        codelldb = function(config)
            config.adapters.lldb = {
                type = 'executable',
                command = 'lldb-vscode',
                name = 'lldb'
            }

            config.configurations.cpp = {
                name = 'Launch',
                type = 'lldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {}
            }

            config.configurations.env = function()
                local variables = {}
                for k, v in pairs(vim.fn.environ()) do
                    table.insert(variables, string.format("%s=%s", k, v))
                end
                return variables
            end

            config.configurations.c = dap.configurations.cpp
            config.configurations.rust = dap.configurations.cpp

            masonDap.default_setup(config)
        end
    }
}

require 'dap-vscode-js'.setup {
    adapters = { 'pwa-node', 'pwa-chrome' }
}
for _, language in ipairs { 'typescript', 'javascript' } do
    dap.configurations[language] = {
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}"
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require 'dap.utils'.pick_process,
            cwd = "${workspaceFolder}"
        },
        {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}"
        },
        {
            type = "pwa-chrome",
            request = "attach",
            name = "Attach",
            processId = require 'dap.utils'.pick_process,
            cwd = "${workspaceFolder}"
        },
        {
            type = "pwa-node",
            request = "launch",
            name = "Debug Jest Tests",
            -- trace = true, -- include debugger info
            runtimeExecutable = "node",
            runtimeArgs = {
                "./node_modules/jest/bin/jest.js",
                "--runInBand",
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
        }
    }
end

require 'dap-python'.setup '~/.virtualenvs/debugpy/bin/python'

-- UI
local dapui = require 'dapui'
dapui.setup {}

require 'nvim-dap-virtual-text'.setup {}

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
