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
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Grep search"})

-- Git
local gitsigns = require'gitsigns'
vim.keymap.set("n", "<leader>gj", function() gitsigns.next_hunk() end, { desc = "Next hunk"})
vim.keymap.set("n", "<leader>gk", function() gitsigns.prev_hunk() end, { desc = "Previous hunk"})
vim.keymap.set("n", "<leader>gB", function() gitsigns.blame_line() end, { desc = "Blame line"})
vim.keymap.set("n", "<leader>gp", function() gitsigns.preview_hunk() end, { desc = "Preview hunk"})
vim.keymap.set("n", "<leader>gr", function() gitsigns.reset_hunk() end, { desc = "Reset hunk"})
vim.keymap.set("n", "<leader>gR", function() gitsigns.reset_buffer() end, { desc = "Reset buffer"})
vim.keymap.set("n", "<leader>gs", function() gitsigns.stage_hunk() end, { desc = "Stage hunk"})
vim.keymap.set("n", "<leader>gu", function() gitsigns.undo_stage_hunk() end, { desc = "Unstage hunk"})
vim.keymap.set("n", "<leader>gd", function() gitsigns.diffthis() end, { desc = "Git diff"})

-- Telescope
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
vim.keymap.set("n", "<leader>fk", function() builtin.keymaps() end, { desc = "Search keymap" })
vim.keymap.set("n", "<leader>gt", function() builtin.git_status() end, { desc = "Git status" })
vim.keymap.set("n", "<leader>gb", function() builtin.git_branches() end, { desc = "Git branches" })
vim.keymap.set("n", "<leader>gc", function() builtin.git_commits() end, { desc = "Git commits" })
vim.keymap.set("n", "<leader>gf", function() builtin.git_files() end, { desc = "Git files" })

-- Explorer
vim.keymap.set("n", "<leader>o", "<cmd>Neotree toggle reveal<CR>", { desc = "Toggle explorer" })
vim.keymap.set("n", "<leader>e", "<cmd>Neotree focus<CR>", { desc = "Focus explorer"})
vim.keymap.set("n", "<leader>b", "<cmd>Neotree toggle buffers<CR>", { desc = "Toggle neotree buffers"})
vim.keymap.set("n", "<leader>ls", "<cmd>AerialToggle!<cr>")
vim.keymap.set("n", "<leader>ld", "<cmd>TroubleToggle document_diagnostics<cr>")
vim.keymap.set("n", "<leader>lD", "<cmd>TroubleToggle workspace_diagnostics<cr>")

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
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move to above split" })

-- Lsp
local preview = require 'goto-preview'
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf, remap = false }
        local buf = vim.lsp.buf

        vim.keymap.set("n", "gd", buf.definition, opts)
        vim.keymap.set("n", "gD", buf.declaration, opts)
        vim.keymap.set("n", "go", buf.type_definition, opts)
        vim.keymap.set("n", "gi", buf.implementation, opts)
        vim.keymap.set("n", "gr", buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<C-S-k>", preview.goto_preview_definition, opts)
        vim.keymap.set("n", "<space>lf", "<cmd>Neoformat<cr>")
        vim.keymap.set("n", "<space>lr", buf.rename, opts)
        vim.keymap.set("n", "<space>la", buf.code_action, opts)
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
    end,
})