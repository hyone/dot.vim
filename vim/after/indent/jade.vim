setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2


if !exists('b:undo_indent')
  let b:undo_indent = ''
endif

let b:undo_indent = 'setlocal ' . join([
\   'expandtab<',
\   'shiftwidth<',
\   'softtabstop<',
\ ])
