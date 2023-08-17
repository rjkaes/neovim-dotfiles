local api = vim.api

require("catppuccin").setup({
    background = {
        light = "latte",
        dark = "mocha",
    },
    show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
    color_overrides = {
        latte = {
            base = "#F5F5F5",
        },
        mocha = {
            base = "#1C1B21",
            mantle = "#1C1B21",
            crust = "#1C1B21",
        },
    },
    integrations = {
        alpha = false,
        cmp = true,
        fidget = true,
        gitsigns = true,
        lsp_trouble= true,
        nvimtree = true,
        treesitter = true,
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

-- Dull the mail signature
api.nvim_set_hl(0, 'mailSignature', { link = 'Comment' })
