return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    'nvim-treesitter/nvim-treesitter-context',
    'rmagatti/goto-preview',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'petertriho/cmp-git',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'onsails/lspkind.nvim',
    'b0o/schemastore.nvim',
    {
        'numToStr/Comment.nvim',
        opts = {},
    },
    {
        'nmac427/guess-indent.nvim',
        opts = {},
    },
    {
        'kylechui/nvim-surround',
        version = "*",
        event = 'VeryLazy',
        config = function()
            require'nvim-surround'.setup{}
        end,
    },
    {
        'altermo/ultimate-autopair.nvim',
        event={'InsertEnter','CmdlineEnter'},
        branch='v0.6',
        opts={},
    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
    },

    -- Language specific
    'windwp/nvim-ts-autotag',
    'seblj/roslyn.nvim',

    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            'neotest',
            'nvim-dap-ui',
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "luvit-meta/library", words = { "vim%.uv" } },
          },
        },
      },
      { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
      { -- optional completion source for require statements and module annotations
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
          opts.sources = opts.sources or {}
          table.insert(opts.sources, {
            name = "lazydev",
            group_index = 0, -- set group index to 0 to skip loading LuaLS completions
          })
        end,
      },
}
