local api = vim.api

require('onedark').setup({
    style = vim.o.background,
    diagnostics = {
        darker = false,
        undercurl = true,
        background = true,
    },
})
vim.cmd.colorscheme 'onedark'

local colors = require('onedark.colors')

api.nvim_set_hl(0, 'Cursor', { bg = colors.bg3 })

if vim.o.background == 'light' then
    api.nvim_set_hl(0, 'CursorLine', { ctermbg = 255, bg = '#e0f5ff' })
    api.nvim_set_hl(0, 'Visual', { ctermbg = 7, bg = '#ffe0e0' })
end

-- Dull the mail signature
api.nvim_set_hl(0, 'mailSignature', { link = 'Comment' })

-- Highlight the "nocheckin" marker
api.nvim_create_autocmd('Syntax', { pattern = '*', command = [[syntax match localCheckinMarker ":nocheckin:"]] })
api.nvim_set_hl(0, 'localCheckinMarker', { link = 'Error' })
