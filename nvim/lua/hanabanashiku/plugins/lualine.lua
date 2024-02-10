require 'lualine'.setup {
    extensions = { 'aerial', 'neo-tree', 'nvim-dap-ui', 'trouble' },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { 'lsp_progress', 'diagnostics' },
        lualine_x = {},
        lualine_y = { 'filetype' },
        lualine_z = { 'location' },
    }
}