vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
	buffer = 0,
	callback = function()
		vim.lsp.codelens.refresh({ bufnr = 0 })
	end,
})

-- Auto-resize panes with vim window size change
vim.api.nvim_command("autocmd VimResized * wincmd =")
