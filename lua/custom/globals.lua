-- Make sure <leader> is set *early*
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.g.cpp_attributes_highlight = 1
vim.g.python3_host_prog = '/usr/local/bin/python3'

-- Configure netrw to behave mostly like NERDTree
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25

-- Tada Configuration for TODO list
vim.g.tada_todo_style = 'unicode'
vim.g.tada_todo_pane_file = 'TODO'
vim.g.tada_todo_pane_location = 'top'

vim.g['semshi#always_update_all_highlights'] = true

-- Ruby testing
vim.g.ruby_host_prog = vim.fn.expand('$HOME/.rubies/ruby-3.1.3/bin/ruby')
vim.g.ruby_path = vim.g.ruby_host_prog

vim.g['test#preserve_screen'] = 0
vim.v['test#strategy'] = 'dispatch'

-- Run rspec (with bundle exec) but use the "rails" compiler to parse the output
vim.g['test#ruby#bundle_exec'] = 1

-- TODO: Figure out how to manipulate these tables with lua
vim.cmd[[
if !exists('g:dispatch_compilers')
  let g:dispatch_compilers = {}
endif
let g:dispatch_compilers['bundle exec '] = ''
]]