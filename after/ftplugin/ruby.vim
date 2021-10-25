setlocal foldexpr=getline(v:lnum)=~'^\\s*#'
setlocal foldlevel=100 " Open all folds by default
setlocal foldmethod=expr
setlocal shiftwidth=2
setlocal spelllang=en_ca
setlocal tabstop=2
setlocal textwidth=80
setlocal colorcolumn=+1
setlocal equalprg="rubocop -x -s"

" colourize the operators and space errors
let ruby_operators = 1
let ruby_space_errors = 1

" Spell check strings. :)
let ruby_spellcheck_strings = 1

" Use the "do" block style when indenting
let g:ruby_indent_block_style = 'do'
