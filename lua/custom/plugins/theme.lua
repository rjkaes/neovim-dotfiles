-- Make sure these are always loaded regardless of what colorscheme is used.
local dependencies = {
    -- Hightlight hex colors, etc.
    { 'NvChad/nvim-colorizer.lua', name = 'colorizer', config = true, lazy = false },

    -- Add missing LSP colors
    { 'folke/lsp-colors.nvim', name = 'lsp-colors', lazy = false, config = true },
}

return {
    -- light
    {
        'rakr/vim-one',
        lazy = false,
        priority = 1000,
        init = function() vim.g.one_allow_italics = true end,
        dependencies = dependencies,
    },
    -- dark
    {
        'jacoborus/tender.vim',
        lazy = false,
        priority = 1000,
        dependencies = dependencies,
    },

    -- Highlight TODO, NOTE, etc.
    {
        'folke/todo-comments.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = true,
    },
}
