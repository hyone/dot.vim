setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal formatoptions-=r

"   avoid to automatically indent when input \ at the head of line.
let g:vim_indent_cont = 0


"   to reset settings made by this,
"   using change filetype in same buffer.
if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= '
\ | setlocal shiftwidth<
\ | setlocal softtabstop<
\ | setlocal expandtab<
\ | setlocal formatoptions<
\ '
