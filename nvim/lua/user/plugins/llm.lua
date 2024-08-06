return {
    'github/copilot.vim',
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "github/copilot.vim" },
            { "nvim-lua/plenary.nvim" },
        },
        config = function()
            if vim.fn.filereadable('~/.config/github-copilot/hosts.json') == 1
                or vim.fn.filereadable('~/AppData/Local/github-copilot/hosts.json') == 1 then
                pcall(require 'CopilotChat'.setup)
            end
        end
    }
}