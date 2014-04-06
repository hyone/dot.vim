setlocal smartindent
setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class

if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif

let b:undo_ftplugin = 'setlocal ' . join([
\   'smartindent<',
\   'cinwords<',
\ ])
