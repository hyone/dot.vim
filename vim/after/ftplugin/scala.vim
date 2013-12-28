setlocal expandtab

nnoremap <silent> <buffer> <C-a>i)    vi)ge:\<C-u>'<,'>Align =><CR>
nnoremap <silent> <buffer> <C-a>i(    vi(ge:\<C-u>'<,'>Align =><CR>
nnoremap <silent> <buffer> <C-a>i}    vi}ge:\<C-u>'<,'>Align =><CR>
nnoremap <silent> <buffer> <C-a>i{    vi{ge:\<C-u>'<,'>Align =><CR>


if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= '
\ | setlocal expandtab<
\ '
