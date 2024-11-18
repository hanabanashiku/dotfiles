return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000
    },
    'rmagatti/auto-session',
    {
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = {}
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'mrjones2014/smart-splits.nvim',
        version = 'v1.5.*'
    },
    'famiu/bufdelete.nvim',
    'rcarriga/nvim-notify',
    'HiPhish/rainbow-delimiters.nvim',
    {
        'stevearc/aerial.nvim',
        opts = {},
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },
    { -- breadcrumbs
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
    },
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    {
        'Chaitanyabsprip/fastaction.nvim',
        ---@type FastActionConfig
        opts = {},
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    }
}
