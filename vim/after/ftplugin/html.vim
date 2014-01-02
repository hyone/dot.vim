compiler tidy

"   use -raw to display correctly japanese character
setlocal makeprg=tidy\ -raw\ -quiet\ -errors\ --gnu-emacs\ yes\ \"%\"

"   to reset smartchr behaviour
inoremap <silent> <buffer> = =


if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= '
\ | setlocal makeprg<
\ '
