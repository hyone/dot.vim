setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab


if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif
let b:undo_indent .= '
\ | setlocal expandtab< shiftwidth< softtabstop<
\'
