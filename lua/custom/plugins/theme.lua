return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        dependencies = {
            -- Hightlight hex colors, etc.
            { 'NvChad/nvim-colorizer.lua' },

            -- Add missing LSP colors
            { 'folke/lsp-colors.nvim' },
        },
        init = function()
            local read_file = function(path)
                local file = io.open(path, "r")
                if not file then return nil end
                local content = file:read()
                file:close()
                return content
            end

            -- Read in the current background mode and set the background theme (default to
            -- "light".)  Relies on the environment variable set by `bin/setbg`
            local background_color = function()
                return read_file(vim.fn.expand("$HOME/CloudStation/current_background_mode")) or 'light'
            end

            vim.opt.termguicolors = true
            vim.opt.background = background_color()
        end,
        config = function()
            require('colorizer').setup()
            require("catppuccin").setup({
                background = {
                    light = "latte",
                    dark = "frappe",
                },
                transparent_background = true,
                integrations = {
                    cmp = true,
                    fidget = true,
                    gitsigns = true,
                    lsp_trouble = true,
                    neogit = true,
                    telescope = true,
                    treesitter= true,

                    indent_blankline = {
                        enabled = true,
                        colored_indent_levels = false,
                    },
                    native_lsp = {
                        enabled = true,
                    },
                },
            })
            vim.cmd.colorscheme "catppuccin"
        end,
    },
}
