source ~/.vim/after/ftplugin/text.vim
setlocal textwidth=72

" Remove everything from the current line to just before the signature.
nmap <buffer> <silent> <LocalLeader>r :call <SID>RemoveReplyLines()<CR>

" Insert my signature
iabb rjk Thanks.<cr><space><space><space><space>--rjk<cr><esc>

function s:RemoveReplyLines()
    .,/^--/-2d
    noh
endfunction
