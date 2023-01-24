-- local ctp_feline = require('catppuccin.groups.integrations.feline')
--
-- require("feline").setup({
--     components = ctp_feline.get()
-- })
--
local spotify = require('nvim-spotify').status

spotify:start()

require('lualine').setup {
    options = {
        theme = "catppuccin"
        -- ... the rest of your lualine config
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'lsp_progress' },
        lualine_x = {
           spotify.listen
        },
        lualine_y = { 'encoding', 'filetype' },
        lualine_z = { 'location' }
    },
    extensions = { 'neo-tree', 'aerial', 'toggleterm', 'nvim-dap-ui', 'fzf' }
}
