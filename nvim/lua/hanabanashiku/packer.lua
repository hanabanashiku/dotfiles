local packer_config = function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'

    -- Fuzzy search
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require 'gitsigns'.setup {} end
    }

    -- LSP
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use { 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'
    use 'onsails/lspkind.nvim'
    use 'b0o/schemastore.nvim'
    use 'rmagatti/goto-preview'
    use 'folke/neodev.nvim'
    use {
        "kylechui/nvim-surround",
        config = function() require 'nvim-surround'.setup {} end
    }
    use { 'numToStr/Comment.nvim', config = function() require 'Comment'.setup {} end }
    use 'hoffs/omnisharp-extended-lsp.nvim'
    use {
        'nmac427/guess-indent.nvim',
        config = function() require 'guess-indent'.setup {} end,
    }
    use {
        'windwp/nvim-autopairs',
        config = function() require 'nvim-autopairs'.setup {} end,
    }
    use {
        'windwp/nvim-ts-autotag',
        config = function() require 'nvim-ts-autotag'.setup {} end,
    }

    -- UI
    use { 'catppuccin/nvim', as = "catppuccin" }
    use 'kyazdani42/nvim-web-devicons'
    use 'hood/popui.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'arkav/lualine-lsp-progress' }
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function() require 'indent_blankline'.setup {} end
    }
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use {
        'akinsho/bufferline.nvim',
        config = function() require 'bufferline'.setup {} end,
    }
    use 'mrjones2014/smart-splits.nvim'
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            -- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }
    use {
        'stevearc/aerial.nvim',
        config = function() require 'aerial'.setup() end,
    }
    use {
        'nvchad/nvim-colorizer.lua',
        config = function() require 'colorizer'.setup {} end,
    }
    use {
        'akinsho/toggleterm.nvim',
        config = function() require 'toggleterm'.setup {} end,
    }
    use 'rmagatti/auto-session'
    use 'HiPhish/nvim-ts-rainbow2'

    -- DAP
    use 'mfussenegger/nvim-dap'
    use 'jay-babu/mason-nvim-dap.nvim'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'mxsdev/nvim-dap-vscode-js'
    use 'mfussenegger/nvim-dap-python'
    use {
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm install --legacy-peer-deps && npm run compile"
    }

    -- Testing
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "Issafalcon/neotest-dotnet",
            "nvim-neotest/neotest-python",
            "haydenmeade/neotest-jest",
            "rouge8/neotest-rust"
        }
    }

    use 'ThePrimeagen/vim-be-good'

end

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

vim.cmd.packadd('packer.nvim')

local packer_bootstrap = ensure_packer()

return require('packer').startup({ function(use)
    packer_config(use)

    if packer_bootstrap then
        require('packer').sync()
    end

end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end
        }
    }
})
