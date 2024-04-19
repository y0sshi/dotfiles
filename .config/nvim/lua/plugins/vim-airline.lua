-- vim-airline
vim.api.nvim_set_var('airline_powerline_fonts' , 1)
vim.api.nvim_set_var('airline#extensions#tabline#enabled' , 1)

-- lualine
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'powerline_dark',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'filename', 'branch', 'diff'},
        lualine_c = {'diagnostics'},
        lualine_x = {'fileformat', 'encoding', 'filetype'},
        lualine_y = {},
        lualine_z = {'progress', 'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

