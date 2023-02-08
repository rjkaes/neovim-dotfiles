vim.opt.termguicolors = true
require('colorizer').setup()

local api = vim.api

if vim.o.background == 'light' then
    require('github-theme').setup({
        theme_style = "light_default",
    })

    api.nvim_set_hl(0, 'CursorColumn', { ctermbg = 255, bg = '#e0f5ff' })
    api.nvim_set_hl(0, 'CursorLine', { ctermbg = 255, bg = '#e0f5ff' })
    api.nvim_set_hl(0, 'Visual', { ctermbg = 7, bg = '#ffe0e0' })
    api.nvim_set_hl(0, 'ColorColumn', { bg = '#f9f7f7' })

    api.nvim_set_hl(0, 'Todo', { fg = '#a626a4', bg = '#fafafa', bold = true })
else
    vim.cmd[[colorscheme tender]]
end

api.nvim_set_hl(0, 'Define', { link = 'Statement' })

-- Use a underline for the search group (rather than a harsh highlight)
api.nvim_set_hl(0, 'Search', { fg = 'NONE', bg = 'NONE', underline = true, ctermfg = 'NONE', ctermbg = 'NONE' })

-- Dull the mail signature
api.nvim_set_hl(0, 'mailSignature', { link = 'Comment' })

-- Highlight the "nocheckin" marker
api.nvim_create_autocmd('Syntax', { pattern = '*', command = [[syntax match localCheckinMarker "\v\:nocheck(in)?\:" containedin=.*Comment contained]] })
api.nvim_set_hl(0, 'localCheckinMarker', { link = 'ErrorMsg' })
