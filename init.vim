" Disable standard plugins.  These have all been replaced by faster options.
let g:loaded_matchparen        = 1
let g:loaded_matchit           = 1
let g:loaded_logiPat           = 1
let g:loaded_rrhelper          = 1
let g:loaded_tarPlugin         = 1
" let g:loaded_man               = 1
let g:loaded_gzip              = 1
let g:loaded_zipPlugin         = 1
let g:loaded_2html_plugin      = 1
let g:loaded_shada_plugin      = 1
let g:loaded_tutor_mode_plugin = 1

let mapleader="\<Space>"
let maplocalleader=","

let g:cpp_attributes_highlight = 1

let g:python3_host_prog = '/usr/local/bin/python3'

let g:ruby_host_prog = expand('$HOME/.rubies/ruby-3.1.3/bin/ruby')
let g:ruby_path = g:ruby_host_prog

let g:test#preserve_screen = 0
let test#strategy = 'dispatch'

" Run rspec (with bundle exec) but use the "rails" compiler to parse the output
let g:test#ruby#bundle_exec = 1
if !exists('g:dispatch_compilers')
  let g:dispatch_compilers = {}
endif
let g:dispatch_compilers['bundle exec '] = ''
" let g:dispatch_compilers['rspec'] = 'rake'

" Configure netrw to behave mostly like NERDTree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

let g:semshi#always_update_all_highlights = v:true

set cursorline
set expandtab
set grepprg=rg\ --vimgrep\ $*
set hidden
set list
set listchars=tab:▸\ ,nbsp:¬,extends:»,precedes:«,trail:•
set rtp+=~/.fzf
set showbreak=↪
set spelllang=en_ca
set tabstop=4 softtabstop=4 shiftwidth=4
set tags+=.git/tags
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set updatetime=300
set winwidth=83 " Give enough space for the gutter

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

" Ignore a bunch of VCS, swap, and backup files.
set wildignore+=*.swp,*.bak
set wildignore+=.hg,.git,.svn
set wildignore+=*.spl
set wildignore+=*.sw?

" Turn click-me warnings about swapfiles into discreet little messages
set shortmess+=A

" Load plugins
call plug#begin('~/.vim_plugins')
" Color scheme
Plug 'owickstrom/vim-colors-paramount'
Plug 'rakr/vim-one'
Plug 'mhartington/oceanic-next'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'jacoborus/tender.vim'

" Hightlight hex colors, etc.
Plug 'NvChad/nvim-colorizer.lua'

" Add missing LSP colors
Plug 'folke/lsp-colors.nvim'

" Status line
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Make it easier to remap an alternative for the escape key
Plug 'zhou13/vim-easyescape'

" Sneak Search'
Plug 'justinmk/vim-sneak'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'voldikss/vim-floaterm'

" Replace matchit.vim and matchparen
Plug 'andymass/vim-matchup'

" Toggle multiple terminals
Plug 'akinsho/toggleterm.nvim'

" Fuzzy finder
" Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
" Plug 'junegunn/fzf.vim'

" Telescope (fuzzy finder)
Plug 'nvim-telescope/telescope.nvim' | Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" A bunch of Tim Pope plugins to make using vim easier
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-endwise', { 'for': ['lua', 'elixir', 'ruby', 'crystal', 'sh', 'bash', 'zsh', 'vim', 'c', 'cpp', 'make'] }
Plug 'tpope/vim-repeat' | Plug 'tpope/vim-abolish' | Plug 'tpope/vim-surround' | Plug 'tpope/vim-unimpaired' | Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch' | Plug 'radenling/vim-dispatch-neovim' | Plug 'kassio/neoterm' | Plug 'janko-m/vim-test'
Plug 'tpope/vim-fugitive' | Plug 'tommcdo/vim-fubitive'

" Tabular
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

" Distraction free writing
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

Plug 'TimUntersberger/neogit'
Plug 'lewis6991/gitsigns.nvim'

" LSP
Plug 'folke/trouble.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'prabirshrestha/vim-lsp'
Plug 'nvim-lua/lsp-status.nvim'

" Use the project's settings if a `.editorconfig` file is defined.
Plug 'editorconfig/editorconfig-vim'

Plug 'cweagans/vim-taskpaper'

" C++
Plug 'bfrg/vim-cpp-modern'
Plug 'p00f/clangd_extensions.nvim'

" Crystal
Plug 'vim-crystal/vim-crystal', { 'for': 'crystal' }

" Python
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Ruby
Plug 'jlcrochet/vim-ruby' | Plug 'tpope/vim-rails'
Plug 'kana/vim-textobj-user' | Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'simrat39/rust-tools.nvim'

" Slim Templates
Plug 'slim-template/vim-slim', { 'for': 'slim' }

" Show indentation
Plug 'lukas-reineke/indent-blankline.nvim'

" Fast folding
Plug 'kevinhwang91/nvim-ufo' | Plug 'kevinhwang91/promise-async'
call plug#end()

lua require('config')

" Quit everything!
nnoremap QA :qa!<cr>

" switch to using Perl standard regular expressions
nnoremap / /\v
vnoremap / /\v

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" open TODO file
nnoremap <silent> <leader>o :split TODO<cr>

" toggle between last two buffers (normally ctrl-shift-6)
nnoremap <silent> <leader><tab> <c-^>

" Quickly write the file
nnoremap <silent> <leader>w :w<CR>

" Reformat using LSP
nnoremap <silent> <localleader>f <cmd>lua vim.lsp.buf.formatting()<cr>
vnoremap <silent> <localleader>f <cmd>lua vim.lsp.buf.formatting()<cr>

nnoremap <silent> <leader>q :call <SID>ToggleWindow("quickfix")<cr>
nnoremap <silent> <leader>l :call <SID>ToggleWindow("loclist")<cr>

" Clear the search highlighting (use 8 to pair with `*`)
nnoremap <silent> <leader>8 :nohlsearch<cr>

" Fuzzy finder
nnoremap <leader><leader> <cmd>Telescope find_files<cr>
nnoremap <leader>j <cmd>Telescope buffers<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>t <cmd>Telescope tags<cr>

" Test runner
nnoremap <silent> <leader>sf <cmd>TestFile<cr>
nnoremap <silent> <leader>so <cmd>TestNearest<cr>
nnoremap <silent> <leader>sa <cmd>TestSuite<cr>
nnoremap <silent> <leader>ss <cmd>TestLast<cr>

nnoremap <leader>gb :Git blame<cr>
nnoremap <leader>gci :Neogit kind=split_above<cr>
nnoremap <leader>gcc :Git commit<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gd :Gvdiffsplit<CR>
nnoremap <leader>gg :grep<space>
nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>
nnoremap <leader>gm :GMove<cr>
nnoremap <leader>gr :GRemove<cr>
nnoremap <leader>gs :Git<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" Shortcode to reference current file's path in command line mode.
cnoremap <expr> %% expand('%:h').'/'

" Copy the visual contents to the system clipboard
vnoremap <leader>y "+y

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

" Enable 24bit colors if we're not SSH'd into a remote server.
if $COLORTERM ==? "truecolor"
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    set termguicolors
    lua require'colorizer'.setup()

    if &background ==? "light"
        let g:one_allow_italics = 1
        colorscheme one

        highlight! CursorColumn ctermbg=255 guibg=#e0f5ff
        highlight! CursorLine ctermbg=255 guibg=#e0f5ff
        highlight! Visual ctermbg=7 guibg=#ffe0e0
        highlight! ColorColumn guibg=#f9f7f7

        call one#highlight('Todo', 'a626a4', 'fafafa', 'bold')
        call one#highlight('rubyBlockParameter', '4078f2', '', 'none')
        call one#highlight('rubyBlockParameterList', '4078f2', '', 'none')
    else
        " colorscheme tokyonight-night
        colorscheme tender
    endif

    " Create custom colors for LSP giagnostics
    highlight! DiagnosticError ctermfg=Red guifg=#db4b4b
    highlight! DiagnosticWarn ctermfg=DarkYellow guifg=#e0af68
    highlight! DiagnosticInfo ctermfg=LightBlue guifg=#0db9d7
    highlight! DiagnosticHint ctermfg=Green guifg=#10B981
else
    set t_Co=256
    colorscheme paramount
endif

highlight! link Define Statement

" Use a underline for the search group (rather than a harsh highlight)
hi Search guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline

" Enable italics for comments
highlight Comment cterm=italic gui=italic

" Dull the mail signature
highlight! link mailSignature Comment

" Highlight the "nocheckin" marker
autocmd Syntax * syntax match localCheckinMarker "\v\:nocheck(in)?\:" containedin=.*Comment contained
highlight! link localCheckinMarker ErrorMsg
inoreabbr :nc: :nocheckin:

" Provide an alternative to Escape in insert mode
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 50
cnoremap jk <ESC>
cnoremap kj <ESC>

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
    autocmd BufNewFile,BufRead TODO set filetype=taskpaper

    " Force .slim to use slim filetype
    autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

    " Highlight yank
    au TextYankPost * silent! lua vim.highlight.on_yank()
augroup END

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" autocomplete using coq
inoremap <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
inoremap <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
inoremap <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
inoremap <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
inoremap <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<C-X>\<C-U>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"
