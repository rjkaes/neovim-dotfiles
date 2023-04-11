local api = vim.api

require('onedark').setup({
    style = vim.o.background,
    ending_tildes = true,
    diagnostics = {
        darker = false,
        undercurl = true,
        background = true,
    },
    highlights = {
        Cursor = { bg = '$bg3', fmt = 'none' },
        CursorLine = { bg = '$diff_change' }, -- light: #e0f5ff
        Visual = { bg = '$diff_delete' }, -- light: #ffe0e0
    },
})

vim.cmd.colorscheme 'onedark'

-- Dull the mail signature
api.nvim_set_hl(0, 'mailSignature', { link = 'Comment' })

-- Highlight the "nocheckin" marker
api.nvim_create_autocmd('Syntax', { pattern = '*', command = [[syntax match localCheckinMarker ":nocheckin:"]] })
api.nvim_set_hl(0, 'localCheckinMarker', { link = 'Error' })
