" NOTE: Setup again here because somehow it has been overwritten when enter 'haml' file.
inoremap <buffer><expr> =
\ search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\<bar>:\<bar>!=\) \%#', 'bcn')
\ ? '<bs>= '
\ : search('\(*\<bar>!\<bar><bar><bar>\)\%#', 'bcn')
\   ? '= '
\   : search('[^=] \%#', 'bcn')
\     ? '= '
\     : smartchr#loop(' = ', '=', ' == ',  '==', ' === ')
