-- bootstrap (lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


-- plugin setup
require("lazy").setup({
    -- UI
    {
        -- color scheme
        {
            "Mofiqul/vscode.nvim",
            "ellisonleao/gruvbox.nvim",
        },

        -- statusline
        {
            "nvim-lualine/lualine.nvim",
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
        },

        "romgrk/barbar.nvim",
        "lambdalisue/fern.vim",
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- LSP
    {
        {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            build = ":MasonUpdate",
            opts = {},
        },
        {
            "neovim/nvim-lspconfig",
            -- "hrsh7th/vim-vsnip",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
        },
        {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
            "mfussenegger/nvim-lint",
            "mhartington/formatter.nvim",
        },
    },

    -- snippet
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
        },
    },

    -- git
    {
        {
            "NeogitOrg/neogit",
            dependencies = {
                "nvim-lua/plenary.nvim",         -- required
                "sindrets/diffview.nvim",        -- optional - Diff integration

                -- Only one of these is needed, not both.
                "nvim-telescope/telescope.nvim", -- optional
                "ibhagwan/fzf-lua",              -- optional
            },
            config = true
        },
        {
            "sindrets/diffview.nvim"
        },
    },

    -- ChatGPT
    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        config = function()
            require("chatgpt").setup()
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "folke/trouble.nvim",
            "nvim-telescope/telescope.nvim"
        }
    },

    -- others
    {
        "mattn/invader-vim",
    },
})


-- Plugin Settings
require("plugins/nvim-chatgpt")
require("plugins/nvim-lsp")
require("plugins/vim-airline")
require("plugins/color-scheme")
require("plugins/snippet")

