
"   ElmCast/elm-vim  {{{2
" ==================================================

let g:elm_setup_keybindings = 0

let g:elm_classic_highlighting = 1

call neocomplete#util#set_default_dictionary(
  \ 'g:neocomplete#sources#omni#input_patterns',
  \ 'elm',
  \ '\.')

"   smartchr.vim  {{{2
" ==================================================

inoremap <buffer><expr> : smartchr#one_of(' : ', ':', ' :: ', '::')
