require("neotest").setup {
    adapters = {
        require("neotest-python")({
            dap = { justMyCode = false },
        }),
        require("neotest-jest"),
        require("neotest-rust"),
        require("neotest-dotnet")({
            dap = { justMyCode = false }
        })
    }
}
