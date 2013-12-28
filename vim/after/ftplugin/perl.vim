:compiler perl

let g:perl_compiler_force_warnings = 0
"   treat ':' as keyword only when automatically popup completion menu by acp.
"   bacause I want to complete module name with '::'.
let b:acp_addKeyword = ':'

setlocal expandtab
"   prevent vim from automatically inserting a comment delimiter when inputing new line.
setlocal formatoptions-=r

if !has("win32")
    set tags=$HOME/.vim/tags/perl.tags,./tags;
endif

"   Align.vim
" --------------------------------------------------

"   ignore comment
AlignCtrl v ^\s*#

"   align Hash
nnoremap <silent> <buffer> <C-a>i)    vi)ge:\<C-u>'<,'>Align =><CR>
nnoremap <silent> <buffer> <C-a>i(    vi(ge:\<C-u>'<,'>Align =><CR>
nnoremap <silent> <buffer> <C-a>i}    vi}ge:\<C-u>'<,'>Align =><CR>
nnoremap <silent> <buffer> <C-a>i{    vi{ge:\<C-u>'<,'>Align =><CR>
"   not work. I don't know why...
" function! s:align_hash(border)
  " echomsg "align_hash"
  " execute 'normal!' "vi".a:border."k:<C-u>'<,'>Align =><CR>"
" endfunction


if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= '
\ | setlocal expandtab<
\ '
