require 'lualine'.setup {
    options = {
        theme = "catppuccin"
    },
    extensions = { 'aerial', 'neo-tree', 'nvim-dap-ui', 'trouble' },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {},
        lualine_x = { 'fileformat', 'filetype'},
        lualine_y = {},
        lualine_z = {'location', 'searchcount'}
      }
}