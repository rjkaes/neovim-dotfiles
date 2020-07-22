let g:test#preserve_screen = 1
let test#strategy = 'dispatch'
let g:dispatch_compilers = { 'bundle exec': '' }

" Git Integration
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '!'
let g:gitgutter_sign_modified_removed = '!_'
let g:gitgutter_sign_removed = '_'
let g:gitgutter_sign_removed_first_line = '‾'

" Disable both ruby and nodejs providers as they slow down the startup
" (especially when opening Ruby files)
let g:loaded_ruby_provider = 1
let g:loaded_node_provider = 1

" Autocomplete
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()
let g:python3_host_prog = '/usr/local/bin/python3'

" Auto-linting
let g:ale_ruby_rubocop_executable = 'rubocop'
let g:ale_ruby_rubocop_options='-c ~/.rubocop.yml'

" fix files on save
let g:ale_fix_on_save = 1

" Don't run the linter when the file changes or when it's open.  Only when
" it's saved.
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" use nice symbols for errors and warnings
let g:ale_set_highlights = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" fixer configurations
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" NOTE: These must be defined before vim-crystalline is loaded.
function! MyALEStautsLine()
    let total = ale#statusline#Count(bufnr('%'))['total']
    if total == 0
        return ''
    else
        return printf(" ⚠%d", total)
    endif
endfunction

function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

function! StatusLine(current, width)
    let l:s = ''

    if a:current
      let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
    else
      let l:s .= '%#CrystallineInactive#'
    endif
    let l:s .= ' %f%h%w%m%r '
    if a:current
      let l:s .= crystalline#right_sep('', 'Fill') . '%{fugitive#head()}'
    endif

    let l:s .= '%='
    if a:current
      let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
      let l:s .= crystalline#left_mode_sep('')
    endif
    if a:width > 80
      let l:s .= ' %{&ft}[%{&enc}][%{&ffs}] %-14.(%l/%L %c%V%) %P%( %{MyALEStautsLine()}% '
    else
      let l:s .= ' '
    endif

    return l:s
endfunction

function! TabLine()
    let l:vimlabel = has("nvim") ?  " NVIM " : " VIM "
    return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
endfunction

let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_theme = 'papercolor'
let g:crystalline_enable_sep = 1
let g:crystalline_separators = ['»', '«']

call plug#begin('~/.vim_plugins')
" Color scheme
Plug 'Nequo/vim-allomancer'
Plug 'andreypopp/vim-colors-plain'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'evansb/vim-colors-pencil'
Plug 'rakr/vim-one'
Plug 'rakr/vim-two-firewatch'
Plug 'sonph/onehalf', { 'rtp': 'vim/' }
Plug 'tomasr/molokai'
Plug 'owickstrom/vim-colors-paramount'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'

" Status line
Plug 'rbong/vim-crystalline'

" Easy way to align by a separator (for example with tomdocs)
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

" A solid language pack (a collection of language packs)
Plug 'sheerun/vim-polyglot'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'

" A bunch of Tim Pope plugins to make using vim easier
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat' | Plug 'tpope/vim-abolish' | Plug 'tpope/vim-surround' | Plug 'tpope/vim-unimpaired' | Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch' | Plug 'radenling/vim-dispatch-neovim' | Plug 'kassio/neoterm' | Plug 'janko-m/vim-test'
Plug 'tpope/vim-fugitive' | Plug 'tommcdo/vim-fubitive'

" Better git commit editing.
Plug 'rhysd/committia.vim'

" ... and show git changes.
Plug 'airblade/vim-gitgutter'

" ... full blown git diffing and staging
Plug 'jreybert/vimagit'

" Ruby
" Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'kana/vim-textobj-user' | Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }

" Asynchronous completion framework
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

" Adds various text objects to give you more targets to operate on
Plug 'wellle/targets.vim'

" Async linting engine
Plug 'w0rp/ale'

" Add the `Bdelete` command.
Plug 'moll/vim-bbye', { 'on': 'Bdelete' }

" Making VIM a writing environment
Plug 'dbmrq/vim-ditto'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } | Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-textobj-quote'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'

" Lisp editing
Plug 'eraserhd/parinfer-rust', { 'do': 'cargo build --release', 'for': 'clojure' }

" Clojure REPL
Plug 'Olical/conjure', { 'tag': 'v2.1.1', 'do': 'bin/compile', 'for': 'clojure' }
call plug#end()

let mapleader="\<Space>"

" Modify the defaults to better match my usage
set autoread
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set cursorline
set expandtab
set grepprg=rg\ --vimgrep\ $*
set hidden
set history=10000
set hlsearch
set laststatus=2
set list
set listchars=tab:▸\ ,trail:·,extends:>,precedes:<
set noautowrite                         " don't automagically write on :next
set nobackup
set noswapfile
set scrolloff=3
set shiftwidth=4
set showbreak=↪
set showmatch
set softtabstop=4
set nosplitright
set statusline=%!StatusLine()
set switchbuf=useopen
set tabstop=4
set wildmode=longest,list
set winheight=5
set winminheight=5
set winwidth=80

" Set the default font for GUI applications
set guifont=IBM\ Plex\ Mono\ Text:h19

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

" Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

set updatetime=250

" Ignore a bunch of VCS, swap, and backup files.
set wildignore+=*.swp,*.bak
set wildignore+=.hg,.git,.svn
set wildignore+=*.spl
set wildignore+=*.sw?

" Use the old vim regex engine (version 1, as opposed to version 2, which was
" introduced in Vim 7.3.969). The Ruby syntax highlighting is significantly
" slower with the new regex engine.
" set re=1

" Enable Neovim specific settings
if has('nvim')
    set inccommand=nosplit
else
    set viminfo=
end

augroup vimrcEx
    autocmd!

    autocmd FileType ruby,eruby,rspec setlocal shiftwidth=2 tabstop=2
    autocmd FileType c setlocal shiftwidth=8
    autocmd FileType python setlocal noexpandtab

    " Enable breakindent for text files only
    autocmd FileType markdown,text,gitcommit setlocal breakindent

    " Enable ditto for text like filetypes
    autocmd CursorHold,CursorHoldI markdown,text,gitcommit DittoUpdate

    " Toggle Limelight when entering/leaving Goyo
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!

    " Disable the numbers in the terminal
    au TermOpen * setlocal nonumber norelativenumber

    " Only show the cursor line in the window with focus.
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" ------------------------------------------------------------------------
" Mappings
" ------------------------------------------------------------------------

" Disable arrow keys in normal and insert mode.  Need to train myself not use
" them.

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Quit everything!
nmap QA :qa!<cr>

" Don't move on *
" nnoremap * *<c-o>

" switch to using Perl standard regular expressions
nnoremap / /\v
vnoremap / /\v

" toggle between last two buffers with Z (normally ctrl-shift-6)
nnoremap <silent> <leader>z <C-^>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Configure terminal
if has('nvim')
    " Use Escape to exist back to normal mode.
    tnoremap <Esc> <C-\><C-n>

    " To send a normal escape to the underlying application use Ctrl-v Escape
    tnoremap <M-[> <Esc>
    tnoremap <C-v><Esc> <Esc>

    " Change the default color for the terminal cursor to red
    highlight TermCursor ctermfg=red guifg=red
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

nnoremap <silent> <leader>q :call <SID>ToggleWindow("quickfix")<cr>
nnoremap <silent> <leader>l :call <SID>ToggleWindow("loclist")<cr>

" Clear the search highlighting
nnoremap <silent> <leader>c :nohlsearch<cr>

" Shortcode to reference current file's path in command line mode.
cnoremap <expr> %% expand('%:h').'/'

" ------------------------------------------------------------------------
" Configure Plugins
" ------------------------------------------------------------------------
call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})

" Enable 24bit colors if we're not SSH'd into a remote server.
if empty($SSH_CLIENT)
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
else
    set t_Co=256
endif

let &background=filter([readfile(expand("$HOME/CloudStation/current_background_mode"))[0], 'light'], '!empty(v:val)')[0]

colorscheme paramount

if &background ==? "light"
    let ayucolor="light"
    " colorscheme plain
    highlight! CursorColumn ctermbg=255 guibg=#e0f5ff
    highlight! CursorLine ctermbg=255 guibg=#e0f5ff
    highlight! Visual ctermbg=7 guibg=#ffe0e0
else
    " colorscheme palenight
    highlight! CursorColumn ctermbg=0 guibg=#1d2026
    highlight! CursorLine ctermbg=0 guibg=#1d2026
endif

highlight! link Define Statement

" Use a underline for the search group (rather than a harsh highlight)
hi Search guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline

" Enable italics for comments
highlight Comment cterm=italic gui=italic

" Fuzzy finder
set rtp+=~/.fzf
nmap <leader>t :Files<cr>
nmap <leader>j :Buffers<cr>

" Test runner
nnoremap <silent> <leader>sf :TestFile<cr>
nnoremap <silent> <leader>so :TestNearest<cr>
nnoremap <silent> <leader>sa :TestSuite<cr>
nnoremap <silent> <leader>ss :TestLast<cr>

nmap <leader>ga <Plug>(GitGutterStageHunk)
nmap <leader>gn <Plug>(GitGutterNextHunk)
nmap <leader>gp <Plug>(GitGutterPrevHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)
nnoremap <leader>gaf :Gwrite<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gg :grep<space>
nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

augroup ft_fugitive
    au!

    au BufNewFile,BufRead .git/index setlocal nolist
augroup END

highlight link ALEWarningSign SpellLocal
highlight link ALEErrorSign SpellBad
highlight link ALEWarning SpellBad

function! Prose()
  call pencil#init({'wrap': 'soft'})
  call lexical#init()
  call litecorrect#init()
  call textobj#quote#init()
  call textobj#sentence#init()

  " manual reformatting shortcuts
  nnoremap <buffer> <silent> Q gqap
  xnoremap <buffer> <silent> Q gq
  nnoremap <buffer> <silent> <leader>Q vapJgqap

  " force top correction on most recent misspelling
  nnoremap <buffer> <c-s> [s1z=<c-o>
  inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]A<c-g>u

  " replace common punctuation
  iabbrev <buffer> -- –
  iabbrev <buffer> --- —
  iabbrev <buffer> << «
  iabbrev <buffer> >> »

  " replace typographical quotes (reedes/vim-textobj-quote)
  map <silent> <buffer> <leader>qc <Plug>ReplaceWithCurly
  map <silent> <buffer> <leader>qs <Plug>ReplaceWithStraight

  " highlight words (reedes/vim-wordy)
  noremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  xnoremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  inoremap <silent> <buffer> <F8> <C-o>:NextWordy<cr>
endfunction

command! -nargs=0 Prose call Prose()
