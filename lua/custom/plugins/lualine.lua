return {
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        opts = {
            options = {
                theme = 'catppuccin',
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
