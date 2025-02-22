local isCopilotEnabled = function()
	if vim.g.copilot_disable then
		return false
	end
	local home = os.getenv("HOME") or os.getenv("USERPROFILE")
	local copilot_path = home .. "/.config/github-copilot/apps.json"

	if vim.loop.os_uname().sysname == "Windows_NT" then
		copilot_path = home .. "\\AppData\\Roaming\\GitHub\\Copilot\\apps.json"
	end

	local file = io.open(copilot_path, "r")
	if file then
		file:close()
		return true
	else
		return false
	end
end

return {
	"github/copilot.vim",
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {},
		build = function()
			vim.cmd("TSInstall diff")
		end,
		enabled = isCopilotEnabled(),
	},
}
