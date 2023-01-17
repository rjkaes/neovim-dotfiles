return {
    -- Load the two most common color schemes during startup as we need them
    -- { 'rakr/vim-one', lazy = false, priority = 1000, init = function() vim.g.one_allow_italics = true end, },
    { 'jacoborus/tender.vim', lazy = false, priority = 1000 },
    {
        'sainnhe/edge',
        lazy = false,
        priority = 1000,
        init = function()
            vim.g.edge_better_performance = true
            vim.g.edge_diagnostic_line_highlight = true
            vim.g.edge_diagnostic_virtual_text = 'colored'
            vim.g.edge_style = 'light'
        end,
    },
    { 'folke/tokyonight.nvim', branch = 'main', config = true },
    { 'owickstrom/vim-colors-paramount' },

    -- Hightlight hex colors, etc.
    { 'NvChad/nvim-colorizer.lua' },

    -- Add missing LSP colors
    { 'folke/lsp-colors.nvim' },

    -- Status line
    { 'nvim-lualine/lualine.nvim' },
    { 'kyazdani42/nvim-web-devicons' },

    -- Sneak Search'
    { 'justinmk/vim-sneak' },

    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'voldikss/vim-floaterm' },

    -- Replace matchit.vim and matchparen
    { 'andymass/vim-matchup' },

    -- Toggle multiple terminals
    {
        'akinsho/toggleterm.nvim',
        opts = {
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<c-\>]],
            direction = 'vertical',
        }
    },

    -- Comment stuff in and out with `gc`
    { 'numToStr/Comment.nvim', config = true },

    -- A bunch of Tim Pope plugins to make using vim easier
    { 'tpope/vim-eunuch' },
    { 'tpope/vim-characterize' },
    { 'tpope/vim-endwise', ft = { 'lua', 'elixir', 'ruby', 'crystal', 'sh', 'bash', 'zsh', 'vim', 'c', 'cpp', 'make' } },
    { 'tpope/vim-repeat' },
    { 'tpope/vim-abolish' },
    { 'tpope/vim-surround' },
    { 'tpope/vim-unimpaired' },
    { 'tpope/vim-dispatch' },
    { 'radenling/vim-dispatch-neovim' },
    { 'kassio/neoterm' },
    { 'janko-m/vim-test' },
    { 'tpope/vim-fugitive' },
    { 'tommcdo/vim-fubitive' },

    -- Tabular
    { 'godlygeek/tabular', cmd = 'Tabularize' },

    -- Distraction free writing
    { 'junegunn/goyo.vim', cmd = 'Goyo' },

    { 'folke/trouble.nvim' },
    { 'jose-elias-alvarez/null-ls.nvim' },

    -- Use the project's settings if a `.editorconfig` file is defined.
    { 'editorconfig/editorconfig-vim' },

    -- { 'cweagans/vim-taskpaper'
    { 'dewyze/vim-tada' },

    -- C++
    { 'bfrg/vim-cpp-modern' },
    { 'p00f/clangd_extensions.nvim' },

    -- Crystal
    { 'vim-crystal/vim-crystal', ft = 'crystal' },

    -- -- Python
    -- Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

    -- Ruby
    { 'tpope/vim-rails' },
    { 'jlcrochet/vim-ruby' },
    { 'kana/vim-textobj-user' },
    { 'nelstrom/vim-textobj-rubyblock', ft = 'ruby' },

    -- -- Slim Templates
    -- Plug 'slim-template/vim-slim', { 'for': 'slim' }
}
