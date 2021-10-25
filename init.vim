call plug#begin('~/.vim_plugins')
" Color scheme
Plug 'evansb/vim-colors-pencil'
Plug 'owickstrom/vim-colors-paramount'
Plug 'rakr/vim-one'
Plug 'rakr/vim-two-firewatch'
Plug 'sainnhe/sonokai'
Plug 'axvr/photon.vim'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'

" Telescope (fuzzy finder)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim' | Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" A bunch of Tim Pope plugins to make using vim easier
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat' | Plug 'tpope/vim-abolish' | Plug 'tpope/vim-surround' | Plug 'tpope/vim-unimpaired' | Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch' | Plug 'radenling/vim-dispatch-neovim' | Plug 'kassio/neoterm' | Plug 'janko-m/vim-test'
Plug 'tpope/vim-fugitive' | Plug 'tommcdo/vim-fubitive'

" Git scratch buffer for keeping per-branch notes
Plug 'dbatten5/vim-scranch' | Plug 'dbakker/vim-projectroot'

" A solid language pack (a collection of language packs)
Plug 'sheerun/vim-polyglot'

" Async linting engine
Plug 'dense-analysis/ale'

Plug 'airblade/vim-gitgutter'

" Treesitter for syntax highlighting, etc.
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate', 'branch': '0.5-compat' } | Plug 'romgrk/nvim-treesitter-context'

" Ruby
Plug 'ruby-formatter/rufo-vim', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'kana/vim-textobj-user' | Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }

" Floating windows
Plug 'voldikss/vim-floaterm'

" Writing
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

" Show indentation
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
call plug#end()

" Initialize telescope
lua require('telescope').load_extension('fzf')

" Initialize and configure treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    --- disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
}
EOF

" Initialize indent blanklines
lua << EOF
require("indent_blankline").setup {
    show_first_indent_level = false,
    space_char_blankline = " ",
    show_current_context = true,
    filetype_exclude = {"help"},
    buftype_exclude = {"terminal"},
}
EOF

let mapleader="\<Space>"
let maplocalleader=","

let g:ruby_host_prog = expand('$HOME/.rubies/ruby-2.6.6/bin/ruby')
let g:ruby_path = g:ruby_host_prog

" Git Integration
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '!'
let g:gitgutter_sign_modified_removed = '!_'
let g:gitgutter_sign_removed = '_'
let g:gitgutter_sign_removed_first_line = '‾'

let g:test#preserve_screen = 1
let test#strategy = 'dispatch'
"let g:dispatch_compilers = { 'bundle exec': '' }

" Auto-linting
let g:ale_ruby_rubocop_executable = 'rubocop'
let g:ale_ruby_rubocop_options='-c ~/.rubocop.yml'

" fix files on save
let g:ale_fix_on_save = 1

let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_delay = 2000

" use nice symbols for errors and warnings
let g:ale_set_highlights = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" fixer configurations
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" Disable brakeman linter
let g:ale_linters_ignore = {
\   'ruby': ['brakeman'],
\}

" Configure netrw to behave mostly like NERDTree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

set cursorline
set expandtab
set grepprg=rg\ --vimgrep\ $*
set hidden
set list
set listchars=tab:▸\ ,trail:·,extends:>,precedes:<
set showbreak=↪
set spelllang=en_ca
set tabstop=4 softtabstop=4 shiftwidth=4
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

" Quit everything!
nmap QA :qa!<cr>

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

let &background=filter([readfile(expand("$HOME/CloudStation/current_background_mode"))[0], 'light'], '!empty(v:val)')[0]

" Enable 24bit colors if we're not SSH'd into a remote server.
if empty($SSH_CLIENT)
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors

    " if &background ==? "light"
    "     colorscheme antiphoton
    " else
    "     colorscheme photon
    " endif

    let g:one_allow_italics = 1
    colorscheme one

    " call one#highlight('rubyComment', '', '', 'bold,italic')

    if &background ==? "light"
        call one#highlight('Todo', 'a626a4', 'fafafa', 'bold')
        call one#highlight('rubyBlockParameter', '4078f2', '', 'none')
        call one#highlight('rubyBlockParameterList', '4078f2', '', 'none')
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
else
    highlight! CursorColumn ctermbg=0 guibg=#1d2026
    highlight! CursorLine ctermbg=0 guibg=#1d2026
    highlight! ColorColumn guibg=#332727
endif

highlight! link Define Statement

" Use a underline for the search group (rather than a harsh highlight)
hi Search guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline

" Enable italics for comments
highlight Comment cterm=italic gui=italic

highlight link ALEWarningSign SpellLocal
highlight link ALEErrorSign SpellBad
highlight link ALEWarning SpellBad

" Fuzzy finder
set rtp+=~/.fzf
" nmap <leader>t :Files<cr>
" nmap <leader>j :Buffers<cr>
nmap <leader>t <cmd>Telescope find_files<cr>
nmap <leader>j <cmd>Telescope buffers<cr>

" Test runner
nnoremap <silent> <leader>sf :TestFile<cr>
nnoremap <silent> <leader>so :TestNearest<cr>
nnoremap <silent> <leader>sa :TestSuite<cr>
nnoremap <silent> <leader>ss :TestLast<cr>

nmap <leader>ga <Plug>(GitGutterStageHunk)
nmap <leader>gn <Plug>(GitGutterNextHunk)
nmap <leader>gp <Plug>(GitGutterPrevHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)
nnoremap <leader>gb :Git blame<cr>
nnoremap <leader>gci :Git commit<cr>
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
augroup END
