local api = vim.api

if vim.o.background == 'light' then
    vim.cmd.colorscheme 'one'

    api.nvim_set_hl(0, 'CursorLine', { ctermbg = 255, bg = '#e0f5ff' })
    api.nvim_set_hl(0, 'Visual', { ctermbg = 7, bg = '#ffe0e0' })
else
    vim.cmd.colorscheme 'tender'
end

-- Dull the mail signature
api.nvim_set_hl(0, 'mailSignature', { link = 'Comment' })

-- Highlight the "nocheckin" marker
api.nvim_create_autocmd('Syntax', { pattern = '*', command = [[syntax match localCheckinMarker ":nocheckin:"]] })
api.nvim_set_hl(0, 'localCheckinMarker', { link = 'Error' })
