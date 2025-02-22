vim.loader.enable()

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("user.lazy")
require("user.set")
require("user.colors")
require("user.remap")
require("user.autocmd")
