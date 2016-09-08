"   vim-racer   {{{2
" ==================================================

set hidden
let g:racer_cmd = $HOME.'/.cargo/bin/racer'
let $RUST_SRC_PATH='/usr/local/src/rustc/1.10.0/src'

setlocal omnifunc=


"   smartchr.vim   {{{2
" ==================================================

"   disable smartinput behaviour, and instead of input as it is.
inoremap <expr><buffer> ' ''''
