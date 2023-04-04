local dap = require 'dap'
local masonDap = require 'mason-nvim-dap'

masonDap.setup {
    ensure_installed = { 'coreclr', 'lldb' }
}

masonDap.setup_handlers {
    function(source_name)
        require 'mason-nvim-dap.automatic_setup' (source_name)
    end,

    coreclr = function()
        dap.adapters.coreclr = {
            type = 'executable',
            command = 'netcoredbg',
            args = { '--interpreter=vscode' }
        }

        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "launch - netcoredbg",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
                end
            }
        }
    end,

    codelldb = function()
        dap.adapters.lldb = {
            type = 'executable',
            command = 'lldb-vscode',
            name = 'lldb'
        }

        dap.configurations.cpp = {
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

        dap.configurations.env = function()
            local variables = {}
            for k, v in pairs(vim.fn.environ()) do
                table.insert(variables, string.format("%s=%s", k, v))
            end
            return variables
        end

        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp
    end
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
