require 'nvim-treesitter.configs'.setup {
   ensure_installed = { "c", "c_sharp", "lua", "vim", "rust", "javascript", "typescript",
       "cpp", "css", "html", "json", "jsdoc", "sql", "yaml", "svelte" },
   sync_install = false,
   auto_install = true,
   highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
   }
}

require 'treesitter-context'.setup {}
require 'nvim-ts-autotag'.setup {}

require 'mason'.setup {
    registries={
        'github:mason-org/mason-registry',
        'github:crashdummyy/mason-registry'
    }
}
require 'mason-lspconfig'.setup {
    automatic_installation = true,
    ensure_installed = {
        "lua_ls", "clangd", "cssls", "emmet_ls", "jsonls",
        "ts_ls", "pyright", "sqlls", "lemminx", "yamlls", "svelte"
    }
}
require 'mason-tool-installer'.setup {
    ensure_installed = {
        'roslyn',
        'rzls',
        'csharpier',
        'prettier',
        'eslint-lsp',
        'sqlfmt',
        'rustywind',
        'stylua',
        'shfmt'
    }
}

require 'goto-preview'.setup {}

require 'lspkind'.init {
    preset = 'codicons'
}

local cmp = require 'cmp'
local lspkind = require 'lspkind'

cmp.setup({
    enabled = true,
    preselect = cmp.PreselectMode.None,
    confirmation = {
        completeopt = { 'menu', 'preview', 'menuone' }
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '…'
        })
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<C-j>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-k>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ['<Up>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        ['<Down>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp', priority = 1000 },
        { name = 'luasnip', priority = 750 },
        { name = 'nvim_lsp_signature_help' }
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'cmdline', priority = 1000 },
        { name = 'path', priority = 750 },
    })
})

local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup_handlers {
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities
        }
    end,
    ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    },
                    workspace = {
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    },
                }
            }
        }
    end,
    ["jsonls"] = function()
        require 'lspconfig'.jsonls.setup {
            capabilities = capabilities,
            settings = {
                json = {
                    schemas = require 'schemastore'.json.schemas(),
                    validate = { enable = true }
                },
            },
        }
    end,
    ["yamlls"] = function()
        require 'lspconfig'.yamlls.setup {
            capabilities = capabilities,
            settings = {
                yaml = {
                    schemas = require 'schemastore'.yaml.schemas(),
                }
            }
        }
    end
  }

require("luasnip.loaders.from_vscode").lazy_load()