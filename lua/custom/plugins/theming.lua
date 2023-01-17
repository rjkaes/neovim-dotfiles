local color_theme_mappings = { light = 'OceanicNext', dark = 'tokyonight' }
local local_color_theme = color_theme_mappings[vim.o.background]

return {
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        dependencies = {
            'kyazdani42/nvim-web-devicons',
        },
        opts = {
            options = {
                theme = local_color_theme,
            },

            sections = {
                lualine_b = {
                    'diff',
                    {
                        'diagnostics',
                        sources = { 'nvim_lsp', 'nvim_diagnostic' },
                        colored = false,
                    },
                },
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                        shorten_target = 20,
                    },
                },
                lualine_x = { 'encoding', 'filetype' },
            },
        },

    },
}
