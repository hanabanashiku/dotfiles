require 'neotest'.setup {
    adapters = {
        require 'neotest-dotnet' {
            discovery_root = "project"
        },
        require 'neotest-python',
        require 'neotest-jest' {
            jestCommand = "npm test --",
            env = { CI = true },
            cwd = function(path) vim.fn.getcwd() end
        },
        require 'neotest-vitest'
    }
}
