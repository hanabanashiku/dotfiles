local function set_theme(theme)
   local color = theme or "catppuccin-macchiato"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

set_theme()

vim.ui.select = require'popui.ui-overrider'
vim.ui.input = require'popui.input-overrider'

vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939'})
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef'})
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379'})

vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint' })
vim.fn.sign_define('DapStopped', { text='→', texthl='DapStopped', linehl='DapStopped'})
