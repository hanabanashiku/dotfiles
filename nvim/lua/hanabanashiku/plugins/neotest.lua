require 'neotest'.setup {
    adapters = {
        require 'neotest-dotnet' {
            discovery_root = "project"
        },
        require 'neotest-python',
        require 'neotest-jest',
        require 'neotest-rust'
    }
}
