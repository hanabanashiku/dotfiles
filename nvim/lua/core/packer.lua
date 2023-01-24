local packer_config = function(use)
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  use 'nvim-lua/plenary.nvim'

  -- Fuzzy search
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    'nvim-telescope/telescope-project.nvim',
    config = function()
      require('telescope').load_extension('project')
    end
  }

  -- LSP stuff
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }
  use {
    'stevearc/aerial.nvim',
    config = function()
      require('aerial').setup()
      require('telescope').load_extension('aerial')
    end
  }
  use "onsails/lspkind.nvim"
  use "folke/trouble.nvim"
  use "b0o/schemastore.nvim"
  use "folke/neodev.nvim"

  -- Debugging
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "mfussenegger/nvim-dap-python"
  use { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }
  use {
  "microsoft/vscode-js-debug",
  opt = true,
  run = "npm install --legacy-peer-deps && npm run compile" 
}
  use {
    "nvim-neotest/neotest",
    requires = {
      { "nvim-neotest/neotest-python" },
      { "haydenmeade/neotest-jest" },
      { "rouge8/neotest-rust" },
      { "Issafalcon/neotest-dotnet" },
    }
  }
  use {
    "andythigpen/nvim-coverage",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("coverage").setup()
    end,
  }

  -- UI
  -- use 'liuchengxu/space-vim-theme'
  use { 'catppuccin/nvim', as = "catppuccin" }
  use 'kyazdani42/nvim-web-devicons'
  use 'rcarriga/nvim-notify'
  use 'nvim-lualine/lualine.nvim'
  use 'arkav/lualine-lsp-progress'
  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
  use 'mrjones2014/smart-splits.nvim'
  use 'famiu/bufdelete.nvim'
  use 'goolord/alpha-nvim'
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }
  use 'akinsho/toggleterm.nvim'

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Niceties
  use 'Darazaki/indent-o-matic'
  use 'p00f/nvim-ts-rainbow'
  use 'windwp/nvim-ts-autotag'
  use 'rmagatti/auto-session'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use 'NvChad/nvim-colorizer.lua'
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup() end
  }

  -- Spotify
  use 'HendrikPetertje/vimify'
  use { -- used for status line
    'KadoBOT/nvim-spotify',
    requires = 'nvim-telescope/telescope.nvim',
    run = 'make'
  }

  -- Games
  use 'ThePrimeagen/vim-be-good'
  use 'alec-gibson/nvim-tetris'
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

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

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
  } })
