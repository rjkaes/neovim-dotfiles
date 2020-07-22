setlocal tabstop=2
setlocal shiftwidth=2
setlocal textwidth=120
setlocal foldmethod=expr
setlocal foldexpr=getline(v:lnum)=~'^\\s*#'
setlocal foldlevel=100 " Open all folds by default

" colourize the operators and space errors
let ruby_operators = 1
let ruby_space_errors = 1

" Spell check strings. :)
let ruby_spellcheck_strings = 1

" Use the "do" block style when indenting
let g:ruby_indent_block_style = 'do'

" Reformat
nnoremap <buffer> <silent> _t :%!rbeautify.rb -<CR>
vnoremap <buffer> <silent> _t :call ReindentAfterBeautify()<CR><CR>

" With a visual selection, rbeautify.rb will default to the first line at the
" left most column.  Here we note the initial indent, and then reapply it to
" the visual selection after rbeautify.rb returns
function! ReindentAfterBeautify() range
    let indent = indent(a:firstline)
    let spaces = repeat(' ', indent)
    execute "'<,'>!rbeautify.rb -"
    execute "'<,'>:s/^/" . spaces . "/"
endfunction

