local lsp = require('lsp-zero')
local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

lsp.preset('recommended')

lsp.ensure_installed({
  "bashls",
  "clangd",
  "omnisharp",
  "cssls",
  "dockerls",
  "eslint",
  "emmet_ls",
  "graphql",
  "html",
  "jsonls",
  "tsserver",
  "texlab",
  "sumneko_lua",
  "marksman",
  "spectral", -- openapi
  "pyright",
  "sqlls",
  "tailwindcss"
})

require("neodev").setup{}
lsp.setup()

require('lspconfig').jsonls.setup {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true }
    },
  },
}

cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      ellipsis_char = '...',
      before = function(entry, vim_item)
        return vim_item
      end
    })
  },
}

-- If you want insert `(` after select function or method item
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- autoformat on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
