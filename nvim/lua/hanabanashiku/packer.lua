local packer_config = function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    use("lewis6991/impatient.nvim")

    -- Fuzzy search
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    -- Git
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({})
        end,
    })

    -- LSP
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("nvim-treesitter/nvim-treesitter-context") -- float scope at top of page
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
    use("petertriho/cmp-git")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")
    use("b0o/schemastore.nvim")
    use({
        "rmagatti/goto-preview",
        config = function()
            require'goto-preview'.setup {}
        end
    })
    use {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp"
    }
    use({
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({})
        end,
    })
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({})
        end,
    })

    -- UI
    use("kyazdani42/nvim-web-devicons")
    use("onsails/lspkind.nvim")
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim"
        },
    })
    use({
        "akinsho/bufferline.nvim",
        config = function()
            require("bufferline").setup({})
        end,
    })
    use 'famiu/bufdelete.nvim'
    use("mrjones2014/smart-splits.nvim")
    use({
        "stevearc/aerial.nvim",
        config = function()
            require("aerial").setup()
        end,
    })
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "arkav/lualine-lsp-progress" }
    })
    use({
        'folke/trouble.nvim',
         config = function()
            require'trouble'.setup({})
         end
    })
    use({
        'norcalli/nvim-colorizer.lua',
        config = function()
            require'colorizer'.setup()
        end
    })
     use("HiPhish/nvim-ts-rainbow2")

    -- Formatting
    use({
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('ibl').setup()
        end
    })
    use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}

    -- Language specific
    use("folke/neodev.nvim")
    use({
        "pmizio/typescript-tools.nvim",
        requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("typescript-tools").setup {}
        end
    })
    use("hoffs/omnisharp-extended-lsp.nvim")


end

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

vim.cmd.packadd("packer.nvim")

local packer_bootstrap = ensure_packer()

return require("packer").startup({
    function(use)
        packer_config(use)

        if packer_bootstrap then
            require("packer").sync()
        end
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})
