vim.g.mapleader = " "
vim.keymap.set("n", "<leader> ", "<Nop>")

----- NORMAL
-- Standard ops
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New file" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format file" })
vim.keymap.set("n", "Q", "<Nop>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
        { desc = "Replace current word" })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", function() builtin.find_files { hidden = true, no_ignore = true } end,
        { desc = "Search files" })
vim.keymap.set("n", "<leader>fs", function()
        builtin.live_grep {
                additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
        }
end, { desc = "Search words" })
vim.keymap.set("n", "<leader>fb", function() builtin.buffers() end, { desc = "Search buffers" })
vim.keymap.set("n", "<leader>fo", function() builtin.oldfiles() end, { desc = "Search history" })
vim.keymap.set("n", "<leader>fk", function() builtin.keymaps() end, { desc = "Search keymap" })
vim.keymap.set("n", "<leader>gt", function() builtin.git_status() end, { desc = "Git status" })
vim.keymap.set("n", "<leader>gb", function() builtin.git_branches() end, { desc = "Git branches" })
vim.keymap.set("n", "<leader>gc", function() builtin.git_commits() end, { desc = "Git commits" })

-- NeoTree
vim.keymap.set("n", "<leader>o", "<cmd>Neotree toggle<cr>")
vim.keymap.set("n", "<leader>e", "<cmd>Neotree focus<cr>")
vim.keymap.set("n", "<leader>lS", "<cmd>AerialToggle!<cr>")

-- Buffer
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer tab" })
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer tab" })
vim.keymap.set("n", ">b", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer tab right" })
vim.keymap.set("n", "<b", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer tab left" })
vim.keymap.set("n", "<leader>c", function() require('bufdelete').bufdelete(0, false) end, { desc = "Close buffer" })
vim.keymap.set("n", "<leader>C", function() require('bufdelete').bufdelete(0, true) end, { desc = "Force close buffer" })
vim.keymap.set("n", "<leader>h", "<C-w>s", { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split vertically" })
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move to left split" })
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move to right split" })
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move to below split" })
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move to above s plit" })
vim.keymap.set("n", "<C-Up>", require("smart-splits").resize_up, { desc = "Resize split up" })
vim.keymap.set("n", "<C-Down>", require("smart-splits").resize_down, { desc = "Resize split down" })
vim.keymap.set("n", "<C-Up>", require("smart-splits").resize_up, { desc = "Resize split up" })
vim.keymap.set("n", "<C-Down>", require("smart-splits").resize_down, { desc = "Resize split down" })
vim.keymap.set("n", "<C-Left>", require("smart-splits").resize_left, { desc = "Resize split left" })
vim.keymap.set("n", "<C-Right>", require("smart-splits").resize_right, { desc = "Resize split right" })

-- Diagnostics 
vim.keymap.set("n", "<leader>lo", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "Toggle diagnostic window"})
vim.keymap.set("n", "<leader>lO", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Toggle diagnostic window"})

-- DAP 
local dap = require('dap')
vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = "Continue" })
vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "Continue" })
vim.keymap.set("n", "<F10>", function() dap.step_over() end, { desc = "Step over" })
vim.keymap.set("n", "<leader>ds", function() dap.step_over() end, { desc = "Step over" })
vim.keymap.set("n", "<F11>", function() dap.step_into() end, { desc = "Step into" })
vim.keymap.set("n", "<leader>dS", function() dap.step_into() end, { desc = "Step into" })
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle breakpoint"})
vim.keymap.set("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = "Conditional breakpoint"})
vim.keymap.set("n", "<leader>dlp", function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = "Log point breakpoint"})
vim.keymap.set("n", "<leader>dr", function() dap.repl.toggle() end, { desc = "Toggle REPL" })

-- Testing
local neotest = require('neotest')
vim.keymap.set("n", "<leader>dtr", function() neotest.run.run() end, { desc = "Run closest test" })
vim.keymap.set("n", "<leader>dtf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Run current file" })
vim.keymap.set("n", "<leader>dtd", function() neotest.run.run({ strategy = "dap" }) end, { desc = "Debug closest test"})
vim.keymap.set("n", "<leader>dts", function() neotest.run.stop() end, { desc = "Stop running test"})
vim.keymap.set("n", "<leader>dta", function() neotest.run.attach() end, { desc = "Attach closest test" })
vim.keymap.set("n", "<leader>dte", function() neotest.summary.toggle() end, { desc = "Toggle test explorer"})
vim.keymap.set("n", "<leader>dto", function() neotest.output_panel.toggle() end, { desc = "Toggle test output panel"})
vim.keymap.set("n", "<leader>dtj", function() neotest.jump.next() end, { desc = "Jump to next test"})
vim.keymap.set("n", "<leader>dtk", function() neotest.jump.prev() end, { desc = "Jump to previous test"})
vim.keymap.set("n", "<leader>dtJ", function() neotest.jump.next({ status = "failed" }) end, { desc = "Jump to next failed test"})
vim.keymap.set("n", "<leader>dtK", function() neotest.jump.prev({ status = "failed" }) end, { desc = "Jump to previous failed test"})

-- Spotify
vim.keymap.set("n", "<leader>sp", "<cmd>SpToggle<cr>", { desc = "Play/pause" })
vim.keymap.set("n", "<leader>sh", "<cmd>SpPrevious<cr>", { desc = "Previous track" })
vim.keymap.set("n", "<leader>sl", "<cmd>SpNext<cr>", { desc = "Next track" })
-- vim.keymap.set("n", "<leader>sf", "[[:SpSearch ", { desc = "Search for song" })

-- Terminal
local lazygit = require('toggleterm.terminal').Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTermToggleAll<cr>", { desc = "Toggle terminal" })
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle floating terminal" })
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>",
        { desc = "Toggle horizontal split terminal" })
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>",
        { desc = "Toggle vertical split terminal" })
vim.keymap.set("n", "<leader>tw", "<cmd>term<cr>", { desc = "Toggle terminal tab"})
vim.keymap.set("n", "<F7>", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
vim.keymap.set("n", "<leader>tg", function() lazygit:toggle() end, { desc = "Toggle lazygit" })
vim.keymap.set("t", "<Esc>", "<c-\\><c-n>")
vim.keymap.set("t", "<C-h>", "<c-\\><c-n><c-w>h")
vim.keymap.set("t", "<C-j>", "<c-\\><c-n><c-w>j")
vim.keymap.set("t", "<C-k>", "<c-\\><c-n><c-w>k")
vim.keymap.set("t", "<C-l>", "<c-\\><c-n><c-w>l")
vim.keymap.set("n", "<leader>t1h", "<cmd>1ToggleTerm direction=horizontal<cr>")
vim.keymap.set("n", "<leader>t2h", "<cmd>2ToggleTerm direction=horizontal<cr>")
vim.keymap.set("n", "<leader>t3h", "<cmd>3ToggleTerm direction=horizontal<cr>")
vim.keymap.set("n", "<leader>t4h", "<cmd>4ToggleTerm direction=horizontal<cr>")
vim.keymap.set("n", "<leader>t5h", "<cmd>5ToggleTerm direction=horizontal<cr>")
vim.keymap.set("n", "<leader>t6h", "<cmd>6ToggleTerm direction=horizontal<cr>")
vim.keymap.set("n", "<leader>t7h", "<cmd>7ToggleTerm direction=horizontal<cr>")
vim.keymap.set("n", "<leader>t8h", "<cmd>8ToggleTerm direction=horizontal<cr>")
vim.keymap.set("n", "<leader>t9h", "<cmd>9ToggleTerm direction=horizontal<cr>")
vim.keymap.set("n", "<leader>t0h", "<cmd>0ToggleTerm direction=vertical<cr>")
vim.keymap.set("n", "<leader>t1v", "<cmd>1ToggleTerm direction=vertical<cr>")
vim.keymap.set("n", "<leader>t2v", "<cmd>2ToggleTerm direction=vertical<cr>")
vim.keymap.set("n", "<leader>t3v", "<cmd>3ToggleTerm direction=vertical<cr>")
vim.keymap.set("n", "<leader>t4v", "<cmd>4ToggleTerm direction=vertical<cr>")
vim.keymap.set("n", "<leader>t5v", "<cmd>5ToggleTerm direction=vertical<cr>")
vim.keymap.set("n", "<leader>t6v", "<cmd>6ToggleTerm direction=vertical<cr>")
vim.keymap.set("n", "<leader>t7v", "<cmd>7ToggleTerm direction=vertical<cr>")
vim.keymap.set("n", "<leader>t8v", "<cmd>8ToggleTerm direction=vertical<cr>")
vim.keymap.set("n", "<leader>t9v", "<cmd>9ToggleTerm direction=vertical<cr>")
vim.keymap.set("n", "<leader>t0v", "<cmd>0ToggleTerm direction=vertical<cr>")
-- Git
vim.keymap.set("n", "<leader>gj", function() require("gitsigns").next_hunk() end, { desc = "Next git hunk" })
vim.keymap.set("n", "<leader>gk", function() require("gitsigns").prev_hunk() end, { desc = "Previous git hunk" })
vim.keymap.set("n", "<leader>gl", function() require("gitsigns").blame_line() end, { desc = "Blame line" })
vim.keymap.set("n", "<leader>gp", function() require("gitsigns").preview_hunk() end, { desc = "Preview git hunk" })
vim.keymap.set("n", "<leader>gh", function() require("gitsigns").reset_hunk() end, { desc = "Reset git hunk" })
vim.keymap.set("n", "<leader>gr", function() require("gitsigns").reset_buffer() end, { desc = "Reset git buffer" })
vim.keymap.set("n", "<leader>gs", function() require("gitsigns").stage_hunk() end, { desc = "Stage git hunk" })
vim.keymap.set("n", "<leader>gu", function() require("gitsigns").undo_stage_hunk() end, { desc = "Unstage git hunk" })
vim.keymap.set("n", "<leader>gd", function() require("gitsigns").diffthis() end, { desc = "View git diff" })

-- Comment
vim.keymap.set("n", "<leader>/", function() require("Comment.api").toggle.linewise.current() end,
        { desc = "Comment Line" })

------- VISUAL
vim.keymap.set("v", "p", 'pgv"\'.v:register.\'y`>', { desc = "Paste" })
vim.keymap.set("v", "P", 'Pgv"\'.v:register.\'y`>', { desc = "Paste above" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
        { desc = "Toggle comment line" })
vim.keymap.set("v", "<leader>c", function() require("bufdelete").bufdelete(0, true) end, { desc = "Force close buffer" })
