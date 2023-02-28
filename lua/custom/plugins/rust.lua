return {
    'rust-lang/rust.vim',

    {
        'simrat39/rust-tools.nvim',
        ft = 'rust',
        opts = {
            server = {
                standalone = false,
                settings = {
                    ['rust-analyzer'] = {
                        procMacro = {
                            attributes = {
                                enable = false,
                            },
                            enable = false
                        }
                    }
                }
            },
        },
    },
}
