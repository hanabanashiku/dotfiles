vim.g.neoformat_try_node_exe = 1

vim.cmd [[autocmd BufWritePre *.js Neoformat]]
vim.cmd [[autocmd BufWritePre *.jsx Neoformat]]
vim.cmd [[autocmd BufWritePre *.ts Neoformat]]
vim.cmd [[autocmd BufWritePre *.tsx Neoformat]]