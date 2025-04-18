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
vim.keymap.set("n", "gd", "gdzz")
vim.keymap.set("n", "gi", "gizz")

-- Editing
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "p", "pgv\"'.v:register.'y`>", { desc = "Paste" })
vim.keymap.set("v", "P", "Pgv\"'.v:register.'y`>", { desc = "Paste above" })
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Fuzzy
vim.keymap.set("n", "<leader>cp", function()
	local actions = require("CopilotChat.actions")
	require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end)

-- Buffer
vim.keymap.set("n", "<leader>c", function()
	require("bufdelete").bufdelete(0)
end, { desc = "Close buffer" })
vim.keymap.set("n", "<leader>C", function()
	require("bufdelete").bufdelete(0, true)
end, { desc = "Force close buffer" })
vim.keymap.set("n", "<leader>CE", "<cmd>%bd|e#<cr>", { desc = "Force close all buffers except current" })
vim.keymap.set("n", "<leader>v", "<C-w>s", { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>h", "<C-w>v", { desc = "Split vertically" })

vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
-- swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)

-- Explorer
vim.keymap.set("n", "<leader>o", "<cmd>Neotree toggle reveal<CR>")
vim.keymap.set("n", "<leader>e", "<cmd>Neotree focus<CR>")
vim.keymap.set("n", "<leader>ls", "<cmd>Trouble symbols toggle focus=false<cr>")
vim.keymap.set("n", "<leader>lo", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
vim.keymap.set("n", "<leader>lO", "<cmd>Trouble diagnostics toggle<cr>")

-- DAP
local dap = require("dap")
local dapui = require("dapui")
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
vim.keymap.set("n", "<leader>B", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
vim.keymap.set("n", "<leader>dlp", function()
	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<leader>dr", dap.repl.toggle)
vim.keymap.set("n", "<leader>dk", dapui.eval)
--vim.keymap.set("n", "<leader>dwa", dapui.elements.watches.add)
--vim.keymap.set("n", "<leader>dwd", dapui.elements.watches.remove)
--vim.keymap.set("n", "<leader>dwc", dapui.elements.watches.edit)
--vim.keymap.set("n", "<leader>dwl", dapui.elements.watches.get)

-- LSP
local preview = require("goto-preview")
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, remap = false }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "gi", "<cmd>Trouble lsp_implementations toggle focus=true<cr>")
		vim.keymap.set("n", "gr", "<cmd>Trouble lsp_references toggle focus=true<cr>")
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<C-S-k>", preview.goto_preview_definition, opts)
		vim.keymap.set("n", "<leader>lf", function()
			require("conform").format()
		end)
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>la", function()
			require("fastaction").code_action()
		end, opts)
		vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]e", function()
			vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
		end, opts)
		vim.keymap.set("n", "[e", function()
			vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end, opts)
		vim.keymap.set("n", "<leader>/", function()
			require("Comment.api").toggle.linewise.current()
		end, opts)
		vim.keymap.set(
			"v",
			"<leader>/",
			"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
			opts
		)
		vim.keymap.set(
			"v",
			"<leader>?",
			"<esc><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<cr>",
			opts
		)

		if vim.bo[0].filetype == "cs" then
			for _, client in pairs(vim.lsp.get_clients()) do
				if client.name == "omnisharp" or client.name == "roslyn" then
					local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
					for i, v in ipairs(tokenModifiers) do
						tokenModifiers[i] = v:gsub(" ", "_")
					end
					local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
					for i, v in ipairs(tokenTypes) do
						tokenTypes[i] = v:gsub(" ", "_")
					end
				end
			end
		end
	end,
})
vim.keymap.set("n", "gc", function()
	require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

-- Test
local neotest = require("neotest")
vim.keymap.set("n", "<leader>ltr", function()
	neotest.run.run()
	neotest.output_panel.open()
end)
vim.keymap.set("n", "<leader>ltf", function()
	neotest.run.run(vim.fn.expand("%"))
end)
vim.keymap.set("n", "<leader>ltd", function()
	neotest.run.run({ strategy = "dap" })
end)
vim.keymap.set("n", "<leader>lta", function()
	neotest.run.attach()
end)
vim.keymap.set("n", "]t", function()
	neotest.jump.next()
end)
vim.keymap.set("n", "[t", function()
	neotest.jump.prev()
end)
vim.keymap.set("n", "<leader>lte", function()
	neotest.summary.toggle()
end)
vim.keymap.set("n", "<leader>lto", function()
	neotest.output_panel.toggle()
end)
