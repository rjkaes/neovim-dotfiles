" Use the experimantal filetype.lua for faster startime
let g:do_filetype_lua = 1
let g:did_load_filetypes = 0

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

" ALE
"
" Show diagnostics as virtual text inline and NOT echoed in the command area.
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = '« '
let g:ale_echo_cursor = 0

let g:ale_completion_autoimport = 1
let g:ale_completion_delay = 200
let g:ale_completion_enabled = 1
let g:ale_completion_symbols = {
\ 'text': '',
\ 'method': '',
\ 'function': '',
\ 'constructor': '',
\ 'field': '',
\ 'variable': '',
\ 'class': '',
\ 'interface': '',
\ 'module': '',
\ 'property': '',
\ 'unit': 'unit',
\ 'value': 'val',
\ 'enum': '',
\ 'keyword': 'keyword',
\ 'snippet': '',
\ 'color': 'color',
\ 'file': '',
\ 'reference': 'ref',
\ 'folder': '',
\ 'enum member': '',
\ 'constant': '',
\ 'struct': '',
\ 'event': 'event',
\ 'operator': '',
\ 'type_parameter': 'type param',
\ '<default>': 'v'
\ }

let g:ale_fix_on_save = 1
let g:ale_keep_list_window_open = 0
let g:ale_lint_delay = 2000
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_open_list = 0

" use nice symbols for errors and warnings
let g:ale_set_highlights = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" fixer configurations
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\   'crystal': ['crystal-tool-format'],
\   'python': ['black'],
\   'ruby': ['rubocop-format'],
\   'rust': ['rustfmt'],
\}

let g:ale_ruby_rubocop_executable = 'rubocop'
let g:ale_ruby_rubocop_options='-c ~/.rubocop.yml'

" Disable brakeman linter
let g:ale_linters_ignore = {
\   'ruby': ['brakeman'],
\}

let g:ale_linters = {
\   'ruby': ['rubocop'],
\   'rust': ['analyzer', 'cargo'],
\   'crystal': ['crystal', 'ameba'],
\}

let mapleader="\<Space>"
let maplocalleader=","

let g:cpp_attributes_highlight = 1

let g:python3_host_prog = '/usr/local/bin/python3'

let g:ruby_host_prog = expand('$HOME/.rubies/ruby-2.6.6/bin/ruby')
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

let &background=filter([readfile(expand("$HOME/CloudStation/current_background_mode"))[0], 'light'], '!empty(v:val)')[0]

let g:semshi#always_update_all_highlights = v:true

set completeopt=menu,menuone,noselect,noinsert
set cursorline
set expandtab
set nofoldenable
set grepprg=rg\ --vimgrep\ $*
set hidden
set list
set listchars=tab:▸\ ,nbsp:¬,extends:»,precedes:«,trail:•
set rtp+=~/.fzf
set signcolumn=yes
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
Plug 'evansb/vim-colors-pencil'
Plug 'owickstrom/vim-colors-paramount'
Plug 'rakr/vim-one'
Plug 'rakr/vim-two-firewatch'
Plug 'sainnhe/sonokai'
Plug 'axvr/photon.vim'
Plug 'tomasr/molokai'
Plug 'jacoborus/tender.vim'
Plug 'mhartington/oceanic-next'
Plug 'kyoz/purify', { 'rtp': 'vim' }

" Status line
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

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
" Plug 'tpope/vim-eunuch'
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

" Async linting engine
Plug 'dense-analysis/ale'
Plug 'prabirshrestha/vim-lsp'
Plug 'rhysd/vim-lsp-ale'

" Semantic language support
Plug 'folke/lsp-colors.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'

" Use the project's settings if a `.editorconfig` file is defined.
Plug 'editorconfig/editorconfig-vim'

Plug 'cweagans/vim-taskpaper'

" C++
Plug 'bfrg/vim-cpp-modern'

" Crystal
Plug 'vim-crystal/vim-crystal'

" Python
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Ruby
Plug 'jlcrochet/vim-ruby', { 'for': 'ruby' } | Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'kana/vim-textobj-user' | Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }

" Rust
Plug 'rust-lang/rust.vim'

" " Treesitter for syntax highlighting, etc.
" Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } | Plug 'romgrk/nvim-treesitter-context'

" Show indentation
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
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
nnoremap <silent> <leader><leader> <c-^>

" Quickly write the file
nnoremap <silent> <leader>w :w<CR>

nnoremap <silent> <leader>q :call <SID>ToggleWindow("quickfix")<cr>
nnoremap <silent> <leader>l :call <SID>ToggleWindow("loclist")<cr>

" Clear the search highlighting (use 8 to pair with `*`)
nnoremap <silent> <leader>8 :nohlsearch<cr>

" Fuzzy finder
nnoremap <leader><tab> <cmd>Telescope find_files<cr>
nnoremap <leader>j <cmd>Telescope buffers<cr>
nnoremap <leader>c <cmd>Telescope tags<cr>

" Test runner
nnoremap <silent> <leader>sf :TestFile<cr>
nnoremap <silent> <leader>so :TestNearest<cr>
nnoremap <silent> <leader>sa :TestSuite<cr>
nnoremap <silent> <leader>ss :TestLast<cr>

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

nnoremap <LocalLeader>l :ALELint<return>

" Shortcode to reference current file's path in command line mode.
cnoremap <expr> %% expand('%:h').'/'

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
if empty($SSH_CLIENT)
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors

    " call one#highlight('rubyComment', '', '', 'bold,italic')

    if &background ==? "light"
        let g:one_allow_italics = 1
        colorscheme one

        call one#highlight('Todo', 'a626a4', 'fafafa', 'bold')
        call one#highlight('rubyBlockParameter', '4078f2', '', 'none')
        call one#highlight('rubyBlockParameterList', '4078f2', '', 'none')
    else
        let g:oceanic_next_terminal_bold = 1
        let g:oceanic_next_terminal_italic = 1
        colorscheme OceanicNext
    endif
else
    set t_Co=256
    colorscheme paramount
endif

if &background ==? "light"
    highlight! CursorColumn ctermbg=255 guibg=#e0f5ff
    highlight! CursorLine ctermbg=255 guibg=#e0f5ff
    highlight! Visual ctermbg=7 guibg=#ffe0e0
    highlight! ColorColumn guibg=#f9f7f7

    highlight! ALEVirtualTextError guifg=#d32c39
    highlight! ALEVirtualTextWarning guifg=#d99a26
    highlight! ALEVirtualTextInfo guifg=#6c9f47
else
    highlight! CursorColumn ctermbg=0 guibg=#1d2026
    highlight! CursorLine ctermbg=0 guibg=#1d2026
    highlight! ColorColumn guibg=#332727

    highlight! ALEVirtualTextError guifg=#e06c75
    highlight! ALEVirtualTextWarning guifg=#e5c07b
    highlight! ALEVirtualTextInfo guifg=#98c379
endif

highlight! link Define Statement

" Use a underline for the search group (rather than a harsh highlight)
hi Search guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline

" Enable italics for comments
highlight Comment cterm=italic gui=italic

" Highlight the "nocheckin" marker
autocmd Syntax * syntax match localCheckinMarker "\v\:nocheck(in)?\:" containedin=.*Comment contained
highlight link localCheckinMarker ErrorMsg
inoreabbr :nc: :nocheckin:

highlight link ALEWarningSign SpellLocal
highlight link ALEErrorSign SpellBad
highlight link ALEWarning SpellBad

" Enable type inlay hints
autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }

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
augroup END

function! SmartInsertCompletion() abort
    " Use the default CTRL-N in completion menus
    if pumvisible()
        return "\<C-n>"
    endif

    " Exit and re-enter insert mode, and use insert completion
    return "\<C-c>a\<C-n>"
endfunction
inoremap <silent> <TAB> <C-R>=SmartInsertCompletion()<CR>
set omnifunc=ale#completion#OmniFunc

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
