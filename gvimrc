" gvimrc
" $Id: gvimrc 2519 2010-06-27 16:02:24Z hiro $

" -------------------------------------------------------------------------------
"   Basic Settings
" -------------------------------------------------------------------------------

colorscheme darkneon
" darkblue_custom, camo, daybreak 

" ime
if has('multi_byte_ime') || has('xim')
  set iminsert=0 imsearch=0
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif


" -------------------------------------------------------------------------------
"   Options
" -------------------------------------------------------------------------------

" fonts
if has("win32")
    set guifont=MeiryoKe_Console:h12
    " set guifont=MeiryoKe_Gothic:h12
elseif has("mac")
    set guifont=Osaka-Mono\ for\ Powerline:h16
    set guifontwide=Osaka-Mono\ for\ Powerline:h14
else
    set guifont=Consolas\ 14
endif

" delete menubar and toolbar
set guioptions-=m
set guioptions-=T

" if we use gvim, set it in gvimrc
set nohlsearch

" " make background transparency
" gui
" set transparency=220

"   overwrite GVim default cmdheight (can't overwrite on vimrc)
set cmdheight=1

"   MacVim specified options
if has('gui_macvim')
  set imdisable
  set transparency=2
  "   use option key as meta key
  set macmeta
endif

" -------------------------------------------------------------------------------
"   Keybind
" -------------------------------------------------------------------------------

"  Normal Mode
" --------------------------------------------------

"   oneshot key to save current buffer
nnoremap <M-,>  :w<CR>

"   open directory that has the file of current buffer bu Explorer.
if has('win32')
    nnoremap <silent><M-e> :!start explorer /select,%:p<cr>
endif

"  Insert Mode
" --------------------------------------------------

"   move to the bottom/top of the buffer
inoremap <M-j> <C-Down>
inoremap <M-k> <C-Up>
"   move by a word
inoremap <M-h> <C-Left>
inoremap <M-l> <C-Right>

"   paste from clipboard
inoremap <M-p> <ESC>"+gpa

"   oneshot key to save current buffer
inoremap <M-,>  <Esc>:w<CR>

"  Commandline Mode
" --------------------------------------------------

cnoremap <M-h> <S-Left>
cnoremap <M-l> <S-Right>


" ===============================================================================
"   Source external files   {{{1
" ===============================================================================

if filereadable (expand("~/.vimrc.local"))
  source ~/.vimrc.local
elseif filereadable (expand($VIM . "/.vimrc.local"))
  source $VIM/.vimrc.local
endif


" vim: expandtab softtabstop=2 shiftwidth=2
" vim: set foldmethod=marker
