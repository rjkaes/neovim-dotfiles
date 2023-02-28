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
