local dap = require("dap")
local dapui = require("dapui")

-- dotnet
dap.adapters.coreclr = {
    type = 'executable',
    command = 'netcoredbg',
    args = { '--interpreter=vscode' }
}
dap.configurations.cs = {
    type = "coreclr",
    name = "Launch",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug', 'file')
    end
}

-- C / C++ / Rust
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
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
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- Python
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python3")

-- Node
require("dap-vscode-js").setup{
    adapters = { 'pwa-node', 'pwa-chrome', 'node-terminal' }
}

-- UI
dapui.setup {}
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
