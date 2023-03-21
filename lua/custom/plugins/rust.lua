return {
    'rust-lang/rust.vim',

    {
        'simrat39/rust-tools.nvim',
        ft = { 'rust', 'rs' },
        opts = {
                server = {
                    settings = {
                        ['rust-analyzer'] = {
                            cargo = {
                                allFeatures = true,
                            },
                            completion = {
                                postfix = {
                                    enable = false,
                                },
                            },
                        },
                    },
                },

        },
    },
}
