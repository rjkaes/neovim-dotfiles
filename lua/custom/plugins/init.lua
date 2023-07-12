return {
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
    { 'kassio/neoterm' },
    {
        'janko-m/vim-test',
        dependencies = {
            'radenling/vim-dispatch-neovim',
            dependencies = { 'tpope/vim-dispatch' },
        },
    },
    {
        'tpope/vim-fugitive',
        dependencies = { 'tpope/vim-rhubarb' },
    },
    { 'tommcdo/vim-fubitive' },

    -- Tabular
    { 'godlygeek/tabular', cmd = 'Tabularize' },

    -- Distraction free writing
    { 'junegunn/goyo.vim', cmd = 'Goyo' },

    { 'folke/trouble.nvim' },
    { 'jose-elias-alvarez/null-ls.nvim' },

    -- Use the project's settings if a `.editorconfig` file is defined.
    { 'editorconfig/editorconfig-vim' },

    -- Undo tree
    { 'mbbill/undotree' },

    -- { 'cweagans/vim-taskpaper'
    { 'dewyze/vim-tada' },

    -- C++
    { 'bfrg/vim-cpp-modern' },
    { 'p00f/clangd_extensions.nvim' },

    -- C#
    { 'jlcrochet/vim-razor' },

    -- Crystal
    { 'vim-crystal/vim-crystal', ft = 'crystal' },

    -- HTML
    {
        'AndrewRadev/tagalong.vim',
        init = function()
            vim.g.tagalong_additional_filetypes = {'razor'}
        end
    },

    -- -- Python
    -- Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

    -- Ruby
    { 'tpope/vim-rails' },
    { 'jlcrochet/vim-ruby' },
    { 'kana/vim-textobj-user' },
    { 'nelstrom/vim-textobj-rubyblock', ft = 'ruby' },

    -- -- Slim Templates
    { 'slim-template/vim-slim', ft = 'slim' },
}
