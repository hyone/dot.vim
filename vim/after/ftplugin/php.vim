" smartchr.vim
" --------------------------------------------------

inoremap <buffer> <expr> =
\ search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\<bar>!=\) \%#', 'bcn')
\ ? '<bs>= '
\ : search('\(*\<bar>!\)\%#', 'bcn') 
\   ? '= '
\   : smartchr#one_of(' = ', '=', ' == ', ' === ')
