vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.conceallevel = 0

vim.opt.scrolloff = 8
vim.opt.updatetime = 750
vim.cmd("set noshowmode")

vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"

vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.api.nvim_command("autocmd FileType * set formatoptions-=co")