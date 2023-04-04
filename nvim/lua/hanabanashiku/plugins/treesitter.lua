require 'nvim-treesitter.configs'.setup {
   ensure_installed = { "c", "lua", "vim", "rust", "javascript", "typescript",
      "c_sharp", "cpp", "css", "html", "json", "jsdoc", "sql", "yaml" },
   sync_install = false,
   auto_install = true,
   highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
   },
   rainbow = {
      enable = true,
      query = 'rainbow-parens',
      strategy = require 'ts-rainbow'.strategy.global
   }
}

require 'treesitter-context'.setup {}
