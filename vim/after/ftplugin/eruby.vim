" "   surround.vim
" call SurroundRegister('b', 'd', "<% \r %>")

setlocal expandtab


if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= '
\ | setlocal expandtab<
\ '
