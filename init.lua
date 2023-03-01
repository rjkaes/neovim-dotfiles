vim.g.mapleader = " "
vim.g.maplocalleader = ","

require "custom.disable_builtin"
require "custom.globals"
require 'custom.background'

-- Start up the package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy package manager.  Taken from:
-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/init.lua#L70-L86
require("lazy").setup("custom.plugins", {
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
    },
  },
})

require 'custom.options'

vim.cmd[[
" Toggle the quickfix or loclist windows.
function! s:ToggleWindow(type)
    let toggles = {'quickfix': ['c', 'v:val.quickfix && !v:val.loclist'], 'loclist': [ 'l', 'v:val.quickfix && v:val.loclist'] }

    let prefix = toggles[a:type][0]
    let predicate = toggles[a:type][1]

    try
        if empty(filter(getwininfo(), predicate))
            execute prefix . "open"
        else
            execute prefix . "close"
        endif
    catch
        echo "Could not toggle" a:type "window"
    endtry
endfunction
nnoremap <silent> <leader>q :call <SID>ToggleWindow("quickfix")<cr>
nnoremap <silent> <leader>l :call <SID>ToggleWindow("loclist")<cr>
]]

vim.cmd [[
" Configure terminal
if has('nvim')
    " Use Escape to exist back to normal mode.
    tnoremap <Esc> <C-\><C-n>

    " To send a normal escape to the underlying application use Ctrl-v Escape
    tnoremap <M-[> <Esc>
    tnoremap <C-v><Esc> <Esc>

    " Change the default color for the terminal cursor to red
    highlight TermCursor ctermfg=red guifg=red

    set inccommand=nosplit
endif
]]

vim.cmd[[
" Enable type inlay hints
" autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }

augroup ft_fugitive
    au!

    au BufNewFile,BufRead .git/index setlocal nolist
augroup END

augroup vimrcEx
    autocmd!

    " Enable breakindent for text files only
    autocmd FileType markdown,text,gitcommit setlocal breakindent

    " Disable the numbers in the terminal
    au TermOpen * setlocal nonumber norelativenumber

    " Only show the cursor line in the window with focus.
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline

    " Make TODO files taskpaper files
    autocmd BufNewFile,BufRead TODO set filetype=tada

    " Force .slim to use slim filetype
    autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

    " Highlight yank
    au TextYankPost * silent! lua vim.highlight.on_yank()
augroup END

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
]]
