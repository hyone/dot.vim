
setlocal expandtab


" smartchr.vim
" --------------------------------------------------

inoremap <buffer> <expr> =
\ search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\<bar>!=\) \%#', 'bcn')
\ ? '<bs>= '
\ : search('\(*\<bar>!\)\%#', 'bcn') 
\   ? '= '
\   : smartchr#one_of(' = ', '=', ' == ', ' === ')


if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= '
\ | setlocal expandtab<
\ '
