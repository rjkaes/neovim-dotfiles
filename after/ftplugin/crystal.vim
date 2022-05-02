setlocal colorcolumn=+1
setlocal shiftwidth=2
setlocal tabstop=2
setlocal textwidth=80
setlocal errorformat=%E%.%#%n)\ %.%#
setlocal errorformat+=%Z%.%#\#\ %f\:%l
setlocal errorformat+=%C%.%#Failure/Error:\ %m
setlocal errorformat+=%C%.%#Expected:\ %m
setlocal errorformat+=%C%.%#got:\ %m
setlocal errorformat+=%C%.%#
setlocal makeprg=crystal\ spec\ --no-color\ %

function! FormatCrystal(buffer) abort
    return {
    \    'command': 'crystal tool format --no-color - 2>/dev/null'
    \}
endfunction

execute ale#fix#registry#Add('crystal-tool-format', 'FormatCrystal', ['crystal'], 'crystal tool format')

" ameba is installed globably
call ale#Set('crystal_ameba_executable', 'ameba')
