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
            -- "ellisonleao/gruvbox.nvim",
        },

        -- statusline
        {
            "nvim-lualine/lualine.nvim",
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
        },

        {
            'romgrk/barbar.nvim',
            dependencies = {
                'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
                'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
            },
            init = function() vim.g.barbar_auto_setup = false end,
            opts = {
                -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
                -- animation = true,
                -- insert_at_start = true,
                -- …etc.
            },
            version = '^1.0.0', -- optional: only update when a new 1.x version is released
            event = {
                'BufRead',
                'BufNewFile',
            },
        },

        {
            "lambdalisue/fern.vim",
            cmd = {
                "Fern",
                "FernDo",
            },
        },

        {
            "nvim-telescope/telescope.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
            cmd = {
                "Telescope",
            },
        },
    },

    -- LSP
    {
        {
            "williamboman/mason.nvim",
            cmd = {
                "Mason",
                "MasonLog",
                "MasonInstall",
                "MasonUninstall",
                "MasonUninstallAll",
                "MasonUpdate",
            },
        },
        {
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
            dependencies = {
                "rcarriga/nvim-dap-ui",
            },
            event = {
                'BufRead',
                'BufNewFile',
            },
        },
        {
            "mfussenegger/nvim-lint",
            event = {
                'BufRead',
                'BufNewFile',
            },
        },
        {
            "mhartington/formatter.nvim",
            event = {
                'BufRead',
                'BufNewFile',
            },
        },
    },

    -- snippet
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
        },
    },

    -- DoxygenToolKit
    {
        "vim-scripts/DoxygenToolkit.vim",
        cmd = {
            "Dox",
            "DoxAuthor",
            "DoxBlock",
            "DoxLic",
            "DoxUndoc",
        },
    },

    -- git
    {
        {
            "kdheepak/lazygit.nvim",
            cmd = {
                "LazyGit",
                "LazyGitConfig",
                "LazyGitCurrentFile",
                "LazyGitFilter",
                "LazyGitFilterCurrentFile",
            },
            -- optional for floating window border decoration
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
            -- setting the keybinding for LazyGit with 'keys' is recommended in
            -- order to load the plugin when the command is run for the first time
            keys = {
                { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
            }
        },
        {
            "NeogitOrg/neogit",
            dependencies = {
                "nvim-lua/plenary.nvim",         -- required

                -- Only one of these is needed, not both.
                "nvim-telescope/telescope.nvim", -- optional
                "ibhagwan/fzf-lua",              -- optional
            },
            config = true,
            cmd = {
                "Neogit",
                "NeogitResetState",
            },
        },
        {
            "sindrets/diffview.nvim",
            cmd = {
                "DiffviewOpen",
                "DiffviewClose",
                "DiffviewLog",
                "DiffviewRefresh",
                "DiffviewFocusFiles",
                "DiffviewFileHistory",
                "DiffviewToggleFiles",
            },
        },
    },

    -- ChatGPT
    {
        "jackMort/ChatGPT.nvim",
        config = function()
            require("chatgpt").setup()
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "folke/trouble.nvim",
            "nvim-telescope/telescope.nvim"
        },
        -- event = "VeryLazy",
        cmd = {
            "ChatGPT",
            "ChatGPTRun",
            "ChatGPTActAs",
            "ChatGPTCompleteCode",
            "ChatGPTEditWithInstructions",
        },
    },

    -- others
    {
        "mattn/invader-vim",
        cmd = {
            "Invader"
        },
    },
})

-- Plugin Settings
require("plugins/color-scheme")
require("plugins/vim-airline")
require("plugins/nvim-lsp")
require("plugins/snippet")
require("plugins/nvim-chatgpt")

