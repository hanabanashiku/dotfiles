local packer_config = function(use)
	use 'wbthomason/packer.nvim'

	-- Fuzzy
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    -- LSP
    use {
        "nvim-treesitter/nvim-treesitter",
        tag = "v0.9.2",
        run = ":TSUpdate"
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'rmagatti/goto-preview'
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
    use("onsails/lspkind.nvim")
    use("b0o/schemastore.nvim")
    use 'sbdchd/neoformat'
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({})
        end,
    })
    use {
        'nmac427/guess-indent.nvim',
        config = function()
            require 'guess-indent'.setup {}
        end,
    }
    use({
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup {}
        end
    })
    use{
        'altermo/ultimate-autopair.nvim',
        event={'InsertEnter','CmdlineEnter'},
        branch='v0.6',
        config=function ()
            require('ultimate-autopair').setup {}
        end,
    }
    use 'windwp/nvim-ts-autotag'
    use {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp"
    }

    -- language-specific
    use 'folke/neodev.nvim'
    use {
        "iabdelkareem/csharp.nvim",
        requires = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
            "Tastyep/structlog.nvim"
        },
        config = function() require 'csharp'.setup {} end
    }

    -- Dap
    use 'mfussenegger/nvim-dap'
    use 'jay-babu/mason-nvim-dap.nvim'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
    use {
        'theHamsta/nvim-dap-virtual-text',
        config = function() require 'nvim-dap-virtual-text'.setup {} end
    }
    use {
      "nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "marilari88/neotest-vitest",
        "nvim-neotest/neotest-jest",
        "nvim-neotest/neotest-python",
        "Issafalcon/neotest-dotnet"
      }
    }
    use { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }
    use 'mfussenegger/nvim-dap-python'
    use {
      "microsoft/vscode-js-debug",
      opt = true,
      run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
    }

    -- UI
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'rmagatti/auto-session'
    use {
        'akinsho/bufferline.nvim',
        tag = "v4.*",
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require 'bufferline'.setup {}
        end
    }
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "arkav/lualine-lsp-progress" },
    })
    use({ 'mrjones2014/smart-splits.nvim', tag = 'v1.3.*' })
    use 'famiu/bufdelete.nvim'
    use 'rcarriga/nvim-notify'
    use 'HiPhish/rainbow-delimiters.nvim'
    use {
        'stevearc/aerial.nvim',
        config = function() require 'aerial'.setup {} end
    }
    use({
  "utilyre/barbecue.nvim",
  tag = "*",
  requires = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("barbecue").setup()
  end,
})
    use {
        "folke/trouble.nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function() require 'trouble'.setup {} end
    }
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} },
        config = function() require 'harpoon'.setup {} end
    }
--   use {
    --       'lukas-reineke/indent-blankline.nvim',
    --       tag = 'v3.*',
    --       config = function() require 'ibl'.setup {} end
    --   }
    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        config = function ()
            require 'gitsigns'.setup {}
        end
    }

    -- LLM
    use 'github/copilot.vim'
    use {
        'CopilotC-Nvim/CopilotChat.nvim',
        branch = "canary",
        requires = {"github/copilot.vim", "nvim-lua/plenary.nvim"},
        config = function ()
            if vim.fn.filereadable('~/.config/github-copilot/hosts.json') == 1
                or vim.fn.filereadible('~/AppData/Local/github-copilot/hosts.json') == 1 then
                pcall(require 'CopilotChat'.setup)
            end
        end
    }

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
