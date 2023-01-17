return {
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        build = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        opts = {
            auto_install = false,
            ensure_installed = { 'lua', 'vim', 'help', 'ruby' },
        },
    },

    -- Additional text objects via treesitter
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
}
