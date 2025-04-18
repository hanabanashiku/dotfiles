local function set_theme(theme)
	local color = theme or "catppuccin-mocha"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

set_theme()

vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939" })
vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef" })
vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379" })

local signs = {
	Error = "",
	Warn = " ",
	Hint = "󰌵",
	Info = " ",
}
vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = signs.Error,
			[vim.diagnostic.severity.WARN] = signs.Warn,
			[vim.diagnostic.severity.HINT] = signs.Hint,
			[vim.diagnostic.severity.INFO] = signs.Info,
			DapBreakpoint = "",
			DapBreakpointCondition = "ﳁ",
			DapBreakpointRejected = "",
			DapLogPoint = "",
			DapStopped = "→",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = signs.Error,
			[vim.diagnostic.severity.WARN] = signs.Warn,
			[vim.diagnostic.severity.HINT] = signs.Hint,
			[vim.diagnostic.severity.INFO] = signs.Info,
		},
		linehl = {
			DapStopped = "DapStopped",
		},
	},
})

vim.ui.select = require("fastaction").select

---@diagnostic disable-next-line: missing-fields
require("notify").setup({
	background_colour = "#000000",
})