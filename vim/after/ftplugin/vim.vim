setlocal formatoptions-=r

"   avoid to automatically indent when input \ at the head of line.
let g:vim_indent_cont = 0


if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif

let b:undo_ftplugin = 'setlocal ' . join([
\   'expandtab<',
\ ])
