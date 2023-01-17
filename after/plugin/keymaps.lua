-- Quit everything!
vim.keymap.set('n', 'QA', ':qa!<cr>')

-- switch to using Perl standard regular expressions
vim.keymap.set({'n','v'}, '/', '/\\v')

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

-- Trouble
vim.keymap.set('n', "<leader>x", "<cmd>TroubleToggle<cr>")

-- LSP formatting
vim.keymap.set('n', '<localleader>f', function() vim.lspconfig.buf.formatting() end)
vim.keymap.set('v', '<localleader>f', function() vim.lspconfig.buf.formatting() end)

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

-- Telescope
vim.keymap.set('n', "<leader><leader>", "<cmd>Telescope find_files<cr>")
vim.keymap.set('n', "<leader>j", "<cmd>Telescope buffers<cr>")
vim.keymap.set('n', "<leader>f", "<cmd>Telescope live_grep<cr>")
vim.keymap.set('n', "<leader>t", "<cmd>Telescope tags<cr>")

-- Test runner
vim.keymap.set('n', '<leader>sf', '<cmd>TestFile<cr>', { silent = true })
vim.keymap.set('n', '<leader>so', '<cmd>TestNearest<cr>', { silent = true })
vim.keymap.set('n', '<leader>sa', '<cmd>TestSuite<cr>', { silent = true })
vim.keymap.set('n', '<leader>ss', '<cmd>TestLast<cr>', { silent = true })
