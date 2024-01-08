--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Write and quit
vim.keymap.set('n', 'ZZ', ':wq<cr>', { silent = true })

-- Quit everything!
vim.keymap.set('n', 'QA', ':qa!<cr>')

-- switch to using Perl standard regular expressions
vim.keymap.set({'n','v'}, '/', '/\\v')

-- Search results centered please
vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })
vim.keymap.set('n', '*', '*zz', { silent = true })
vim.keymap.set('n', '#', '#zz', { silent = true })
vim.keymap.set('n', 'g*', 'g*zz', { silent = true })

-- open TODO file
vim.keymap.set('n', '<leader>o', ':split TODO<cr>', { silent = true })

-- Move around splits with <c-hjkl>
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- toggle between last two buffers (normally ctrl-shift-6)
vim.keymap.set('n', '<leader><tab>', '<c-^>', { silent = true })

-- Quickly write the file
vim.keymap.set('n', '<leader>w', ':w<cr>', { silent = true })

-- Clear the search highlighting (use 8 to pair with `*`)
vim.keymap.set('n', '<leader>8', ':nohlsearch<cr>', { silent = true })

--  Shortcode to reference current file's path in command line mode.
vim.keymap.set('c', '%%', "expand('%:h').'/'", { expr = true })

--  Copy the visual contents to the system clipboard
vim.keymap.set('v', '<leader>y', '"+y')

-- LSP formatting
vim.keymap.set({'n', 'v'}, '<localleader>f', function() require("conform").format() end, { silent = true })

-- Git
vim.keymap.set('n', '<leader>gb', ':Git blame<cr>')
vim.keymap.set('n', '<leader>gci', ':Neogit kind=split_above<cr>')
vim.keymap.set('n', '<leader>gcc', ':Git commit<cr>')
vim.keymap.set('n', '<leader>gco', ':Gcheckout<cr>')
vim.keymap.set('n', '<leader>gd', ':Gvdiffsplit<CR>')
vim.keymap.set('n', '<leader>gg', ':grep<space>')
vim.keymap.set('n', '<leader>gm', ':GMove<cr>')
vim.keymap.set('n', '<leader>gr', ':GRemove<cr>')
vim.keymap.set('n', '<leader>gs', ':Git<cr>')
vim.keymap.set('n', '<leader>gw', ':Gwrite<cr>')
vim.keymap.set('n', 'gdh', ':diffget //2<CR>')
vim.keymap.set('n', 'gdl', ':diffget //3<CR>')

-- Test runner
vim.keymap.set('n', '<leader>sf', '<cmd>TestFile<cr>', { silent = true })
vim.keymap.set('n', '<leader>so', '<cmd>TestNearest<cr>', { silent = true })
vim.keymap.set('n', '<leader>sa', '<cmd>TestSuite<cr>', { silent = true })
vim.keymap.set('n', '<leader>ss', '<cmd>TestLast<cr>', { silent = true })

-- Undo tree toggle
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Noice
vim.keymap.set("n", "<leader>nn", ":NoiceDismiss<CR>", { noremap = true, silent = true })
