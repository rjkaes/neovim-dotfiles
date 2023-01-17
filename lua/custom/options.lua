vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.hlsearch = false
vim.opt.list = true

-- make searches case-sensitive only if they contain upper-case characters
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.grepprg = "rg --vimgrep $*"
vim.opt.listchars = { tab = '▸ ', nbsp = '¬', extends = '»', precedes = '«', trail = '•' }
vim.opt.shiftwidth = 4
vim.opt.showbreak = '↪'
vim.opt.softtabstop = 4
vim.opt.spelllang = 'en_ca'
vim.opt.tabstop = 4

vim.opt.timeoutlen = 300 -- http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
vim.opt.updatetime = 250 
vim.opt.winwidth = 83 -- Give enough space for the gutter

vim.opt.rtp:append { '~/.fzf ' }
vim.opt.tags:append { '.git/tags' }

-- Turn click-me warnings about swapfiles into discreet little messages
vim.opt.shortmess:append 'A'

-- Ignore a bunch of VCS, swap, and backup files.
vim.opt.wildignore:append { '*.swp', '*.bak' }
vim.opt.wildignore:append { '.hg' , '.git', '.svn' }
vim.opt.wildignore:append { '*.spl' }
vim.opt.wildignore:append { '*.sw?' }

vim.wo.signcolumn = 'yes'
