require 'mason'.setup()
require 'mason-lspconfig'.setup {
    ensure_installed = {
        lua_ls, bashls, clangd, csharp_ls, eslint, gopls, graphql,
        html, jsonls, java_language_server, tsserver,
        marksman, spectral, phpactor, pyright, rust_analyzer,
        sqlls, svelte, tailwindcss, lemminx, yamlls, prismals,
        dockerls, docker_compose_language_service
    }
}

-- Fix undefined global 'vim'
require'neodev'.setup {
    library = {
        plugins = { "neotest" },
        types = true
    }
}

-- vscode-like lsp icons
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

-- Insert ( after select function on method item
cmp.event:on(
    'confirm_done',
    require'nvim-autopairs.completion.cmp'.on_confirm_done()
)

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local schemastore = require'schemastore'

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
                    schemas = schemastore.json.schemas(),
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
                    schemas = schemastore.yaml.schemas(),
                }
            }
        }
    end,
    ["omnisharp"] = function()
        local pid = vim.fn.getpid()
        local omnisharp_bin = vim.fn.expand("$HOME/.omnisharp/OmniSharp")

        require 'lspconfig'.omnisharp.setup {
            capabilities = capabilities,
            on_attach = function(_, bufnr)
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
            end,
            handlers = {
                ["textDocument/definition"] = require'omnisharp_extended'.handler,
            },

            cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },

            enable_roslyn_analyzers = false,
            organize_imports_on_format = true,
            enable_import_completion = true,
            sdk_include_prereleases = true
        }
    end
}

require("luasnip.loaders.from_vscode").lazy_load()