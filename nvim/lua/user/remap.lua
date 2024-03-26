vim.g.mapleader = " "
vim.keymap.set("n", "<leader> ", "<Nop>")
vim.keymap.set("n", "Q", "<Nop>")

-- Files
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Force quit" })
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New file" })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })

-- Motions
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Editing
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "p", 'pgv"\'.v:register.\'y`>', { desc = "Paste" })
vim.keymap.set("v", "P", 'Pgv"\'.v:register.\'y`>', { desc = "Paste above" })
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Fuzzy
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff",
    function() builtin.find_files { hidden = true, no_ignore = true } end,
    { desc = "Search files" })
vim.keymap.set("n", "<leader>fw",
    function() builtin.live_grep {
            additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
        }
    end,
    { desc = "Search words " })
vim.keymap.set("n", "<leader>fb", function() builtin.buffers() end, { desc = "Search buffers" })
vim.keymap.set("n", "<leader>fo", function() builtin.oldfiles() end, { desc = "Search history" })
vim.keymap.set("n", "<leader>fk", function() builtin.keymaps() end, { desc = "Search keymap" })
vim.keymap.set("n", "<leader>gt", function() builtin.git_status() end, { desc = "Git status" })
vim.keymap.set("n", "<leader>gb", function() builtin.git_branches() end, { desc = "Git branches" })
vim.keymap.set("n", "<leader>gc", function() builtin.git_commits() end, { desc = "Git commits" })
vim.keymap.set("n", "<leader>gf", function() builtin.git_files() end, { desc = "Git files" })
vim.keymap.set("n", "<leader>cp", function() require 'CopilotChat.integrations.telescope'.pick(require 'CopilotChat.actions'.prompt_actions()) end)

-- Git
local gitsigns = require'gitsigns'
vim.keymap.set("n", "<leader>gj", function() gitsigns.next_hunk() end)
vim.keymap.set("n", "<leader>gk", function() gitsigns.prev_hunk() end)
vim.keymap.set("n", "<leader>gB", function() gitsigns.blame_line() end)
vim.keymap.set("n", "<leader>gp", function() gitsigns.preview_hunk() end)
vim.keymap.set("n", "<leader>gr", function() gitsigns.reset_hunk() end)
vim.keymap.set("n", "<leader>gR", function() gitsigns.reset_buffer() end)
vim.keymap.set("n", "<leader>gs", function() gitsigns.stage_hunk() end)
vim.keymap.set("n", "<leader>gu", function() gitsigns.undo_stage_hunk() end)
vim.keymap.set("n", "<leader>gd", function() gitsigns.diffthis() end)

-- Buffer
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer tab" })
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer tab" })
vim.keymap.set("n", ">b", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer tab right" })
vim.keymap.set("n", "<b", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer tab left" })
vim.keymap.set("n", "<leader>c", function() require'bufdelete'.bufdelete(0) end, { desc = "Close buffer" })
vim.keymap.set("n", "<leader>C", function() require'bufdelete'.bufdelete(0, true) end, { desc = "Force close buffer" })
vim.keymap.set("n", "<leader>CE", "<cmd>%bd|e#<cr>", { desc = "Force close all buffers except current" })
vim.keymap.set("n", "<leader>v", "<C-w>s", { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>h", "<C-w>v", { desc = "Split vertically" })

if vim.loop.os_uname().sysname == "Darwin" then
    vim.keymap.set("n", "<D-Up>", require("smart-splits").resize_up, { desc = "Resize split up" })
    vim.keymap.set("n", "<D-Down>", require("smart-splits").resize_down, { desc = "Resize split down" })
    vim.keymap.set("n", "<D-Left>", require("smart-splits").resize_left, { desc = "Resize split left" })
    vim.keymap.set("n", "<D-Right>", require("smart-splits").resize_right, { desc = "Resize split right" })
else
    vim.keymap.set("n", "<C-Up>", require("smart-splits").resize_up, { desc = "Resize split up" })
    vim.keymap.set("n", "<C-Down>", require("smart-splits").resize_down, { desc = "Resize split down" })
    vim.keymap.set("n", "<C-Left>", require("smart-splits").resize_left, { desc = "Resize split left" })
    vim.keymap.set("n", "<C-Right>", require("smart-splits").resize_right, { desc = "Resize split right" })
end

vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move to left split" })
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move to right split" })
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move to below split" })
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move to above s plit" })

-- Explorer
vim.keymap.set("n", "<leader>o", "<cmd>Neotree toggle reveal<CR>")
vim.keymap.set("n", "<leader>e", "<cmd>Neotree focus<CR>")
-- vim.keymap.set("n", "<leader>b", "<cmd>Neotree toggle buffers<CR>")
vim.keymap.set("n", "<leader>ls", "<cmd>AerialToggle!<cr>")
vim.keymap.set("n", "<leader>lo", "<cmd>TroubleToggle document_diagnostics<cr>")
vim.keymap.set("n", "<leader>lO", "<cmd>TroubleToggle workspace_diagnostics<cr>")

-- Harpoon
local harpoon = require 'harpoon'
vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>HH", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>Hh", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>Hj", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>Hk", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>Hl", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>HJ", function() harpoon:list():next() end)
vim.keymap.set("n", "<leader>HK", function() harpoon:list():prev() end)



-- DAP
local dap = require('dap')
local dapui = require'dapui'
vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<S-F5>", dap.stop)
vim.keymap.set("n", "<C-S-F5>", dap.restart)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<C-F10>", dap.run_to_cursor)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<S-F11>", dap.step_out)
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<F9>", dap.toggle_breakpoint)
vim.keymap.set("n", "<C-S-F9>", dap.clear_breakpoints)
vim.keymap.set("n", "<leader>B", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set("n", "<leader>dlp", function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set("n", "<leader>dr", dap.repl.toggle)
vim.keymap.set("n", "<leader>dk", dapui.eval)
--vim.keymap.set("n", "<leader>dwa", dapui.elements.watches.add)
--vim.keymap.set("n", "<leader>dwd", dapui.elements.watches.remove)
--vim.keymap.set("n", "<leader>dwc", dapui.elements.watches.edit)
--vim.keymap.set("n", "<leader>dwl", dapui.elements.watches.get)

-- LSP
local preview = require 'goto-preview'
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf, remap = false }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<C-S-k>", preview.goto_preview_definition, opts)
        vim.keymap.set("n", "<space>lf", "<cmd>Neoformat<cr>")
        vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<space>la", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<space>ld", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>/", function()
            require 'Comment.api'.toggle.linewise.current()
        end, opts)
        vim.keymap.set("v", "<leader>/",
            "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
            opts)
        vim.keymap.set("v", "<leader>?",
            "<esc><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<cr>",
            opts)

        if vim.bo[0].filetype == "cs" then
            local csharp = require'csharp'
            vim.keymap.set("n", "gd", csharp.go_to_definition)
            vim.keymap.set("n", "<leader>lf", function()
                vim.cmd("Neoformat")
                csharp.fix_usings()
            end)
            vim.keymap.set("n", "<F5>", csharp.debug_project)
            vim.keymap.set("n", "<S-F5>", csharp.debug_project)

            -- Fix for omnisharp bad lex tokens
            for _, client in pairs(vim.lsp.get_active_clients()) do
                if client.name == 'omnisharp' then
                    local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
                    for i, v in ipairs(tokenModifiers) do
                      tokenModifiers[i] = v:gsub(' ', '_')
                    end
                    local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
                    for i, v in ipairs(tokenTypes) do
                      tokenTypes[i] = v:gsub(' ', '_')
                    end
                end
            end

        end
    end,
})
vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

-- Test
local neotest = require'neotest'
vim.keymap.set("n", "<leader>ltr", function() neotest.run.run() end)
vim.keymap.set("n", "<leader>ltf", function() neotest.run.run(vim.fn.expand("%")) end)
vim.keymap.set("n", "<leader>ltd", function() neotest.run.run({ strategy = "dap"}) end)
vim.keymap.set("n", "<leader>lta", function() neotest.run.attach() end)
vim.keymap.set("n", "]t", function() neotest.jump.next() end)
vim.keymap.set("n", "[t", function() neotest.jump.prev() end)
vim.keymap.set("n", "<leader>lte", function() neotest.summary.toggle() end)
vim.keymap.set("n", "<leader>lto", function() neotest.output_panel.toggle() end)
