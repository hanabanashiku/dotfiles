require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "bash", "c", "c_sharp", "cmake", "cpp", "css", "dockerfile", "git_rebase", "gitignore", "gitcommit", "go", "html", "http", "java", "javascript", "json", "json5", "julia", "kotlin", "lua", "markdown", "pascal", "perl", "php", "python", "rust", "ruby", "sql", "svelte", "swift", "tsx", "typescript", "verilog", "vhs", "vue", "yaml"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  autotag = {
    enable = true
  }
}

