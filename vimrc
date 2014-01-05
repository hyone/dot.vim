" ===============================================================================
" vimrc
" @author hyone (http://github.com/hyone)
" ===============================================================================
" Load Guard {{{1

if v:version < 702
  finish
endif


" ===============================================================================
" Basic    {{{1
" ===============================================================================

"   root dicrectory of dotfiles
if has("win32")
  let basedir=$VIM . '\dotfiles\vim\'
else
  let basedir=$HOME . '/.vim/'
endif

"   to display messages in English
language C

"   help language
set helplang=en,ja

if has('vim_starting')
  " to use many extensions of Vim.
  set nocompatible
endif

"   Neobundle   {{{2
" ==================================================

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"   github
NeoBundle 'Shougo/vimproc', {
\   'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\   },
\ }
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'bkad/CamelCaseMotion'
NeoBundleLazy 'cocopon/colorswatch.vim'
NeoBundle 'c9s/perlomni.vim'
NeoBundle 'deris/vim-textobj-enclosedsyntax'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'gkz/vim-ls'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-smartword'
NeoBundle 'kana/vim-textobj-function'
NeoBundle 'kana/vim-textobj-indent'
" NeoBundle 'kana/vim-textobj-lastpat'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'mattn/sonictemplate-vim'
NeoBundle 'mattn/vim-textobj-url'
NeoBundle 'motemen/git-vim'
NeoBundle 'msanders/cocoa.vim'
" NeoBundle 'osyo-manga/vim-textobj-multiblock'
" NeoBundle 'osyo-manga/vim-textobj-multitextobj'
NeoBundle 'rgarver/Kwbd.vim'
NeoBundle 'rhysd/vim-textobj-ruby'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sgur/vim-textobj-parameter'
NeoBundle 'sjl/gundo.vim'
NeoBundle 't9md/vim-textobj-function-ruby'
NeoBundle 'thinca/vim-ft-svn_diff'
" NeoBundle 'thinca/vim-guicolorscheme'
NeoBundle 'thinca/vim-poslist'
NeoBundle 'thinca/vim-prettyprint'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-tabrecent'
NeoBundle 'thinca/vim-textobj-comment'
NeoBundle 'thinca/vim-textobj-function-javascript'
NeoBundle 'thinca/vim-textobj-function-perl'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tyru/capture.vim'
NeoBundle 'tyru/operator-camelize.vim'
NeoBundle 'vim-scripts/JSON.vim'
"   vim-scripts repos
NeoBundle 'Align'
NeoBundle 'matchit.zip'
NeoBundle 'pythoncomplete'
NeoBundle 'sudo.vim'
" NeoBundle 'taglist.vim'
"   non github repos
NeoBundle 'git://repo.or.cz/vcscommand'

if has('vim_starting')
  filetype plugin indent on
  NeoBundleCheck
endif


" ===============================================================================
" Options   {{{1
" ===============================================================================

"   enable filetype-specific autocommands
filetype plugin indent on

"   enable modeline, which is like '# vim: ts=4 filetype=apache'
set modeline

"   <Leader>
let mapleader="\\"
"   <LocalLeader>
let maplocalleader = "_"

" Make faster Vim recognize <Esc> to reduce annoying delay for key codes
" waiting time between key sequence
set timeoutlen=500
set ttimeoutlen=20

"   viminfo
set viminfo=<50,'50,h,n~/.viminfo

"   keyword program
set keywordprg=man

"   grep
set grepprg=internal
" set grepprg=grep\ -nH

"   synclonize clipboard
set clipboard+=unnamed

"   to paste multi lines with correctly indents
" set paste

"   add semi-colon to enable search directories upward.
"   see also ':help file-search' of upward search
set tags=./tags;
" set tags=./tags,tags,../tags

set foldmethod=marker

"   history size
set history=1000

"   change the current directory whenever the current buffer is switched.
" set autochdir

"
set nobackup
"   Write the contents of the file, if it has been modified, on each
"   :next, :rewind, :last, :first, :previous, :stop, :suspend, :tag, :!,
set autowrite
"   automatically save modifications to files when you use critical
"   (external) commands
set writeany
"   re-read the file when it was modified 
"   outside of vim such as by external program.
set autoread

"   tab and space
" --------------------------------------------------
set expandtab
"   indent width
set shiftwidth=4
"   make hitting <Tab> is treated as width of 4 character,
"   while <Tab> character itself already in a file is treated as 'tabstop' width.
set softtabstop=4
"   I want to delete all blanks until tabstop or softtabstop by hitting <BS>
set smarttab

set autoindent
"   if lines starts with specific keywords and hit enter,
"   do autoindex and insert one shiftwidth of indent.
set smartindent

"   search
" --------------------------------------------------
"   because it annoys me to remain highlighted words after searching
set nohlsearch
"   highlight incremental keyword
set incsearch
"
set ignorecase
"   sensitive case when keyword has at least one captal letter.
set smartcase
"   back again to top of file when reaching end of file
set wrapscan

"   undo, redo
" --------------------------------------------------

if has('persistent_undo')
  "   1. use .vimundo dir in the directory in which the file is, if exists
  "   2. otherwise, use .vimundo dir in $HOME directory
  set undodir=./.vimundo,~/.vimundo
  "   enable persistent undo to all the file
  set undofile
endif

"   display format
" --------------------------------------------------
set background=dark

syntax on

"   colorscheme in 256color terminal
if !has('gui_running')
  autocmd VimEnter * :GuiColorScheme darkneon256
endif

"   always show tabline
set showtabline=2

"   custom tabline string
set tabline=%!MyTabLine()

"   highlight the line the cursor is on
" set cursorline
"   highlight only the cursorline in the current window
" augroup cch
  " autocmd! cch
  " autocmd WinLeave * set nocursorline
  " autocmd WinEnter,BufRead * set cursorline
" augroup END

set backspace=indent,eol,start

"   avoid to insert automatically a new line character when a line reaches textwidth size
set textwidth=0

"   show current mode
set showmode

"   display message whenever we affect more than 1 line.
set report=1

"   display correctly texts that include such as ■, ★
set ambiwidth=double

"   make SpecialKeys to be visible, which is such as TAB, Space, WrapMark
set listchars=tab:>-,trail:\ ,extends:>,precedes:<
set list

"   don't insert comment delimiter when typing new line in insert mode
set formatoptions-=r
"   don't insert comment delimiter when entering insert mode by typing 'o' or 'O' in normal mode
set formatoptions-=o

"   display a parenthesis matched one inputed
set showmatch

"   display 3 lines around cursor
set scrolloff=3

"   display always statusline
set laststatus=2

"   show cmd on the statusline, and selecting lines or regions in visual mode
set showcmd

"   statusline format
set statusline=%t\ %<\(%{SnipMid(expand('%:p:h'),70-len(expand('%:p:t')),'...')}\)%=%(\ [%{GitBranch()}]%)\ %m%r%y%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}\ %8(%l,%c%V%)

"   make commandline one-line display
set cmdheight=1

"   enable to move the cursor to positions after the end of the line in Visual-Block mode.
set virtualedit&
set virtualedit+=block

"   display completion candidates in commandline when hit tab
set wildmenu
"   the way to complete filename: display like list only matched
set wildmode=list:longest


" ===============================================================================
"   Key Mappings   {{{1
" ===============================================================================
"
" In console version, use <Nul> or <C-@> to map <C-Space>.
"

"   Normal, Visual and Operator Pending Mode  {{{2
" ==================================================

"   smartword.vim
map w  <Plug>(smartword-w)
map b  <Plug>(smartword-b)
map e  <Plug>(smartword-e)
map ge <Plug>(smartword-ge)

"   use poslist.vim instead of default behavior
map <C-i> <Plug>(poslist-prev-pos)
map <C-o> <Plug>(poslist-next-pos)

noremap J <C-f>
noremap K <C-b>

"   search
noremap n    nzz
noremap N    Nzz
noremap *    *zz
noremap #    #zz
noremap g*   g*zz
noremap g#   g#zz
"   set a mark to the point at which the search is just started
nnoremap /    ms/

"   Select the region last changed
nnoremap gc  `[v`]
vnoremap gc  :<C-u>normal gc<CR>
onoremap gc  :<C-u>normal gc<CR>

"   Select all region
nnoremap gV  ggVG
vnoremap gV  :<C-u>normal gV<CR>
onoremap gV  :<C-u>normal gV<CR>

"   enable 'gv' in operator pending mode
onoremap gv  :<C-u>normal! gv<CR>

"   preserve default behavior of H, M and L
noremap <silent> <Esc>h      H
noremap <silent> <Esc>m      M
noremap <silent> <Esc>l      L


"   Operator Pending Mode   {{{2
" ==================================================

"   Text Objects
" --------------------------------------------------
"
"   textobj-enclosedsyntax: iq, aq
"   textobj-function: if af
"   textobj-indent: ii ai
"   textobj-parameter: i, a,
"   textobj-comment: ic ac
"   textobj-url: au iu

"   textobj-ruby:
"   enable more mappings below:
"   ro: definitions blocks              module, class, def
"   rl: loop blocks                     while, for, until
"   rc: control blocks                  do, begin, if, unless, case
"   rd: do statement                    do
"   rr: any block including above all   all blocks
let g:textobj_ruby_more_mappings = 1

"   surround.vim
" --------------------------------------------------

let g:surround_no_mappings = 1
nmap ds  <Plug>Dsurround
nmap cs  <Plug>Csurround
nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
xmap S   <Plug>VSurround
xmap gS  <Plug>VgSurround

"   textobj-multitextobj.vim
" --------------------------------------------------

let g:textobj_multitextobj_textobjects_group_i = {
\   "paren": [
\     'i)',
\     'i]',
\     'i}',
\   ]
\ }

let g:textobj_multitextobj_textobjects_group_a = {
\   "paren": [
\     'a)',
\     'a]',
\     'a}',
\   ]
\ }

map <expr> <Plug>(textobj-paren-i) textobj#multitextobj#mapexpr_i("paren")
map <expr> <Plug>(textobj-paren-a) textobj#multitextobj#mapexpr_a("paren")

omap imp <Plug>(textobj-paren-i)
omap amp <Plug>(textobj-paren-a)
vmap imp <Plug>(textobj-paren-i)
vmap amp <Plug>(textobj-paren-a)


"   Operator   {{{2
" ==================================================

"   replace region with register text.
" nmap T          <Plug>(operator-replace)
"   shortcut for default yank register
nmap S          ""<Plug>(operator-replace)

"   use 'x' register to keep text for a while ( i.e. avoid to overwrite from other yank. )
nmap <C-x>      "x<Plug>(operator-replace)
" nmap _          "xy
nnoremap _ _

" camelize or decamelize
map sc <Plug>(operator-camelize)
map sC <Plug>(operator-decamelize)

"   Prefix: s
"   use key mappings s* for substitute strings
" --------------------------------------------------
nnoremap <silent> ss    :<C-u>s/^[ \t]\+$//g<CR>
vnoremap <silent> ss    :s/^[ \t]\+$//g<CR>


"   Prefix: <C-s>
" --------------------------------------------------
"   format sequence literal notation
nmap <C-s>n    <Plug>(operator-format-seq-normal)
nmap <C-s>o    <Plug>(operator-format-seq-oneline)
nmap <C-s>e    <Plug>(operator-format-seq-each)


"  Normal Mode  {{{2
" ==================================================
"    modifiers candidates:
"    'g' 's' '.' ',' '\' '<Space>', ';'
"
"    candidate keys to assign maps in normal mode.
"    't', 'T', 'S'
"    <C-a>, <C-x>, <C-s>, <C-g>, <C-l>, <C-q>, <S-Tab>
"
"    refer to http://hogeo.web.fc2.com/vim/ctrl-keys.html

"   newline
nnoremap <CR>             O<Esc>j
"   insert one character with keeping in normal mode
nnoremap <Space>          i<C-r>=<SID>insert_one_character()<Return>

"   Jump to older entry in the tag stack ( i.e. default behavior of CTRL-T )
nnoremap <C-a>            <C-t>

"   Redraw to move cursor at top of window
nnoremap <C-l>            z<CR>

"   go cyclical in a tab list
"   use gt, gT to enable to specify count
nnoremap <silent> H       gT<CR>
nnoremap <silent> L       :TabNextRelative<CR>

"   change the current buffer to the latest edited file.
" nnoremap <C-b>            :<C-u>edit<Space>#<CR>

"   make {count}>> to indent {count} times instead of {count} lines
nnoremap >> :<C-u>execute 'normal!' 'V' . (v:count ? v:count : '') . '>>'<CR>

"   hotkey to the command to change buffers most frequently
"   default behaviors of F and R move to <Esc>F and <Esc>R respectively
nnoremap F                <Nop>
nnoremap <silent> F       :<C-u>UniteWithBufferDir -buffer-name=files_from_cwd buffer file file_mru bookmark file/new<CR>
nnoremap R                <Nop>
nnoremap <silent> R       :<C-u>Unite -start-insert -buffer-name=mrc buffer file_mru:long bookmark file file/new<CR>
nnoremap <silent> <C-j>   :<C-u>Unite buffer<CR>
nnoremap <silent> <C-y>   :<C-u>Unite history/yank<CR>

" "   move to an other window
" nnoremap <C-n>            <C-w>w
" nnoremap <C-p>            <C-w>W

"   yankround.vim
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)


"   Prefix: <C-h>
" --------------------------------------------------
"   key mapppings around help
"
nnoremap <C-h>            :<C-u>help<Space>
nnoremap <C-h><C-h>       :<C-u>tab<Space>help<Space>
"   view help about the word on the current cursor
nnoremap <C-h>]           :<C-u>help<Space><C-r><C-w><CR>


"   Prefix: <leader>
" --------------------------------------------------
"   NERD_Commenter: <leader>c prefix
"   check mappings ':nmap \c' or in 'plugin/NERD_commenter.vim'

"   move the directory has the file of current buffer
nnoremap <silent> <leader>c :<C-u>cd %:p:h<CR>:echo 'cd' getcwd()<CR>
"   source the current buffer
nnoremap <silent> <leader>s :<C-u>source %:p<CR>:echo 'source' expand('%:p')<CR>
"   source the current buffer
nnoremap <silent> <leader>S :<C-u>99verbose source %:p<CR>

"   reopen the current buffer with a specific character set
nnoremap <silent> <leader>ee :<C-u>Eucjp<CR>
nnoremap <silent> <leader>ej :<C-u>Jis<CR>
nnoremap <silent> <leader>es :<C-u>Sjis<CR>
nnoremap <silent> <leader>eu :<C-u>Utf8<CR>
"   convert the current buffer to a specific character set
nnoremap <silent> <leader>eE :<C-u>set fenc=euc-jp<CR>
nnoremap <silent> <leader>eJ :<C-u>set fenc=iso2022jp<CR>
nnoremap <silent> <leader>eS :<C-u>set fenc=cp932<CR>
nnoremap <silent> <leader>eU :<C-u>set fenc=utf-8<CR>

"   git.vim
let g:git_no_map_default = 0
nnoremap <silent> <Leader>gd :<C-u>GitDiff<CR>
nnoremap <silent> <Leader>gD :<C-u>GitDiff<Space>--cached<CR>
nnoremap <silent> <Leader>gs :<C-u>GitStatus<CR>
nnoremap <silent> <Leader>gl :<C-u>GitLog<CR>
nnoremap <silent> <Leader>ga :<C-u>GitAdd<CR>
nnoremap <silent> <Leader>gA :<C-u>GitAdd<Space><cfile><CR>
nnoremap <silent> <Leader>gc :<C-u>GitCommit<CR>
nnoremap <silent> <Leader>gp :<C-u>GitPullRebase<CR>

"   save all buffers
nnoremap <silent> <Leader>w :<C-u>wa<CR>
"   save all buffers and exist
nnoremap <silent> <Leader>x :<C-u>wqa<CR>
"   exist with discarding changes
nnoremap <silent> <Leader>q :<C-u>qa!<CR>


"   Prefix: <C-t>
" --------------------------------------------------
"   disable defualt <C-t> function
"   use :pop instead, and see more :help CTRL-T
nnoremap <C-t>  <Nop>

command! -count=1 TabNextRelative
\   execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')

"   create a new tabpage at the right of the last one
nnoremap <silent> <C-t>c :<C-u>tabnew \| tabmove<CR>
nnoremap <silent> <C-t>n :<C-u>tabnew \| tabmove<CR>
nnoremap <silent> <C-t>d :<C-u>tabclose<CR>
nnoremap <silent> <C-t>o :<C-u>tabonly<CR>
"   use gt, gT to enable to specify count
nnoremap <silent> <C-t>h gT<CR>
nnoremap <silent> <C-t>l :TabNextRelative<CR>
nnoremap <silent> <C-t>H :<C-u>tabfirst<CR>
nnoremap <silent> <C-t>L :<C-u>tablast<CR>
nnoremap <silent> <C-t>i :<C-u>tabs<CR>
"   TabRecent.vim
"   jump to the tab before the latest one
nnoremap <silent> <C-t>r :<C-u>TabRecent<CR>
nnoremap <silent> <C-t>^ :<C-u>TabRecent<CR>

"   mappping to jump a tab by position
for i in range(1,9)
  execute 'nnoremap <silent>' ('<C-t>'.(i))  (i.'gt')
endfor
unlet i

"   mappping to move a tab by position
for i in range(1,9)
  execute 'nnoremap <silent>' ('<C-t>t'    .(i))  (':<C-u>tabmove '.(i-1).'<CR>')
  execute 'nnoremap <silent>' ('<C-t><C-t>'.(i))  (':<C-u>tabmove '.(i-1).'<CR>')
endfor
unlet i


"   Prefix: <Esc>
" --------------------------------------------------
"  mappings have already used above:
"    <Esc>h
"    <Esc>m
"    <Esc>l

"   oneshot key to save current buffer
nnoremap <silent> <Esc>,      :<C-u>w<CR>
"   clean hilight for search
nnoremap <silent> <Esc><Esc>  :<C-u>nohlsearch<CR><Esc>

"   show the full path of the file on the current buffer
nnoremap <silent> <Esc>p      :<C-u>echo expand("%:p")<CR>

"   remap default behaviors of each key mapping
nnoremap <silent> <Esc>F      F
nnoremap <silent> <Esc>R      R
nnoremap <silent> <Esc>i      <C-i>zz
nnoremap <silent> <Esc>o      <C-o>zz


"   Prefix: ,
" --------------------------------------------------
"   ,w : camelcasemotion.vim
"   ,b : camelcasemotion.vim
"   ,e : camelcasemotion.vim

"   VCSCommand
"   <Leader>ca VCSAdd
"   <Leader>cn VCSAnnotate
"   <Leader>cN VCSAnnotate!
"   <Leader>cc VCSCommit
"   <Leader>cD VCSDelete
"   <Leader>cd VCSDiff
"   <Leader>cg VCSGotoOriginal
"   <Leader>cG VCSGotoOriginal!
"   <Leader>ci VCSInfo
"   <Leader>cl VCSLog
"   <Leader>cL VCSLock
"   <Leader>cr VCSReview
"   <Leader>cs VCSStatus
"   <Leader>cu VCSUpdate
"   <Leader>cU VCSUnlock
"   <Leader>cv VCSVimDiff
let g:VCSCommandMapPrefix = ',c'

nmap     <silent> ,,    <Plug>NERDCommenterToggle
vmap     <silent> ,,    <Plug>NERDCommenterToggle

nnoremap <silent> ,h    :<C-u>help<Space>
" nnoremap <silent> ,w    :<C-u>w<CR>
nnoremap          ,r    :<C-u>file<Space>
nnoremap          ,R    :<C-u>Rename<Space>
nnoremap <silent> ,d    :<C-u>bd<CR>
"   delete the buffer without the current window close
if exists(':Kwbd')
  nnoremap <silent> ,D    :<C-u>Kwbd<CR>
endif

"   delete spaces in lines that has only these and no characters.
nnoremap <silent> ,s    :<C-u>%s/^[ \t]\+$//g<CR>
"   copy full path of current buffer
nnoremap <silent> ,c    :<C-u>let @*=expand("%:p")<CR>:echo 'copy' expand('%:p')<CR>
"   list lines contains the word under cursor, and then jump to one in those.
nnoremap <silent> ,I    [I:let nr = input("Which one: ")<Bar>exe"normal " . nr . "[\t"<CR>
"   toggle NERDTree
nnoremap <silent> <C-t>^ :<C-u>TabRecent<CR>
nnoremap <silent> ,f    :<C-u>NERDTreeToggle<CR>
"   toggle TagList
nnoremap <silent> ,t    :<C-u>TlistToggle<CR>
"   paste and reformat/reindent
nnoremap <silent> ,p    p'[v']=
nnoremap <silent> ,P    P'[v']=

nnoremap          ,v    :<C-u>VimgrepInCurrentBuffer<Space>//<Left>
nnoremap          ,V    :<C-u>VimgrepInCurrentDir<Space>//<Left>

"   Prefix: s
"   I decide to use map s* for mapping of substitute
" --------------------------------------------------
"   substitute all indent with spaces
nnoremap <silent> st    :<C-u>set expandtab<CR>:retab<CR>
"   substitute all indent with tabs
nnoremap <silent> sT    :<C-u>set noexpandtab<CR>:retab! 4<CR>
"   substitue a current word
nnoremap <expr>   s#    ':<C-u>%substitute/\<' . expand('<cword>') . '\>//gc' . '<Left><Left><Left>'
" nnoremap <expr>   sg#  ':%substitute/\<' . expand('<cword>') . '\>//gc' . '<Left><Left><Left>'


"   Prefix: q
" --------------------------------------------------
nnoremap q <Nop>
"   preserve for recoding macro
nnoremap Q q

nnoremap <silent> qq    :<C-u>only<CR>

"   quickfix-window
nnoremap <silent> qj    :<C-u>cnext<CR>
nnoremap <silent> qk    :<C-u>cprevious<CR>
nnoremap <silent> qd    :<C-u>cclose<CR>
nnoremap <silent> qo    :<C-u>copen<CR>
"   location-list window
nnoremap <silent> qwj   :<C-u>lnext<CR>
nnoremap <silent> qwk   :<C-u>lprevious<CR>
nnoremap <silent> qwd   :<C-u>lclose<CR>
nnoremap <silent> qwo   :<C-u>lopen<CR>


"   Prefix: g
" --------------------------------------------------

"   move backward in Change List (g, move forward)
nnoremap <silent> g.    g;

"   unite.vim
nnoremap <silent> gb :<C-u>Unite tab buffer<CR>
nnoremap <silent> gf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"   register
nnoremap <silent> gR :<C-u>Unite -buffer-name=register register<CR>
"   buffer, tab
nnoremap <silent> gr :<C-u>Unite -start-insert tab buffer file_mru<CR>
nnoremap <silent> ga :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
"   changelist
nnoremap <silent> gC :<C-u>Unite change<CR>
"   jumplist
nnoremap <silent> gj :<C-u>Unite jump<CR>
"   search in the current project
nnoremap <silent> gp :<C-u>Unite file_rec/async:!<CR>
"   neosnippet
nnoremap <silent> gs :<C-u>Unite snippet<CR>
"   yank history
nnoremap <silent> gy :<C-u>Unite history/yank<CR>
"   search a line in the current buffer
nnoremap <silent> g/ :<C-u>Unite -buffer-name=search line -start-insert<CR>
"   grep
nnoremap <silent> g: :<C-u>Unite grep -buffer-name=grep -start-insert<CR>
"   grep with the word on the current cursor
nnoremap <silent> g; :<C-u>UniteWithCursorWord grep:. -buffer-name=grep -start-insert<CR>
"   grep with the directory of the current buffer belongs
nnoremap <silent> g+ :<C-u>Unite grep:<C-r>=expand('%:p:h')<CR> -buffer-name=grep -start-insert<CR>
"   resume
nnoremap <silent> gz :<C-u>UniteResume<CR>


"   Function Keys
" --------------------------------------------------
"   toggle paste mode
nnoremap <silent> <F2> :<C-u>set invpaste<CR>:set paste?<CR>
nnoremap <silent> <F3> :<C-u>w<CR>:silent! make<CR>

nnoremap <silent> <F8>  :<C-u>TlistToggle<CR>


"  Insert Mode  {{{2
" ==================================================
"    candidate keys to assign maps in insert mode.
"    <C-q> ( = <C-v>), <C-s>, <C-t>
"    modifier:
"    <C-g>

"   move the cursor like emacs
inoremap <silent> <C-n> <C-r>=pumvisible() ? "\<lt>C-n>" : "\<lt>Down>"<CR>
inoremap <silent> <C-p> <C-r>=pumvisible() ? "\<lt>C-p>" : "\<lt>Up>"<CR>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-a> <Home>
inoremap <C-e> <End>

"   aware when completion popup window
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"   close when completation popup window shows
inoremap <expr><C-j> pumvisible() ? neocomplcache#cancel_popup() : "\<C-j>"
inoremap <expr><C-g> pumvisible() ? neocomplcache#cancel_popup() : "\<C-g>"
"   if completation popup open, insert the current candidate and close popup
"   otherwies, select from yank history
inoremap <expr><C-y> pumvisible() ? neocomplcache#close_popup() : "\<Esc>:\<C-u>Unite history/yank\<CR>"

imap <C-o>  <Plug>(neosnippet_expand_or_jump)
" expand snippet if possible
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><C-o> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-o>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" inoremap <C-l> <Right>
" inoremap <C-h> <Left>
" inoremap <C-n> <Nop>
" inoremap <C-n> <C-g>u<BS>

"   set a undo point every time hitting keys below
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>
inoremap <CR>  <C-g>u<CR>

"   kill-line like emacs
inoremap <C-k> <C-o>D
" "   delete indent
" inoremap <C-k> <C-d>

"   delete
inoremap <C-d> <Del>
"   default <C-d> behavior
inoremap <C-q> <C-d>

"   piece-wise copy of the line above the current one
" inoremap <C-b> @@@<Esc>hhkywjl?@@@<CR>P/@@@<CR>3s
"   add new line at the end of current line, and move to next line.
" inoremap <C-f> <Esc>o

"   new line at out of parenthesis.
inoremap <C-s> <Esc><Down>o


inoremap <C-z>{ {  }<Left><Left>
inoremap <C-z>( (  )<Left><Left>
inoremap <C-z>[ [  ]<Left><Left>

inoremap <C-c>{ <C-g>u{<CR>}<Esc>O
inoremap <C-c>( <C-g>u(<CR>)<Esc>O
inoremap <C-c>[ <C-g>u[<CR>]<Esc>O

inoremap <C-c>t  <Esc><C-u>:Unite sonictemplate<CR>


"   smartchr.vim
inoremap <expr> =
\ search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\) \%#', 'bcn')
\ ? '<bs>= '
\ : search('\(*\<bar>!\)\%#', 'bcn') 
\   ? '= '
\   : smartchr#one_of(' = ', '=', ' == ', ' === ')

" inoremap <expr> , smartchr#one_of(', ', ' => ', ',')
inoremap <expr> + smartchr#one_of('+', ' + ', '++', ' ++ ')
inoremap <expr> - smartchr#one_of('-',  ' - ', '--', ' -- ')
inoremap <expr> % smartchr#one_of('%',  ' % ')
inoremap <expr> * smartchr#one_of('*',  ' * ', '**', ' ** ')

augroup MySmartChr
  autocmd!
  autocmd FileType perl,php inoremap <buffer> <expr> . smartchr#one_of('.', ' . ', '..', '...')
augroup END

"   datetime
inoremap <Leader>df  <C-r>=strftime('%Y-%m-%dT%H:%M:%S')<CR>
"   W3CDTF
inoremap <Leader>dF  <C-r>=strftime('%Y-%m-%dT%H:%M:%S+09:00')<CR>
inoremap <Leader>dd  <C-r>=strftime('%Y-%m-%d')<CR>
inoremap <Leader>dm  <C-r>=strftime('%Y-%m')<CR>
inoremap <Leader>dT  <C-r>=strftime('%H:%M:%S')<CR>
inoremap <Leader>dt  <C-r>=strftime('%H:%M')<CR>

"   oneshot key to save current buffer
" inoremap <Esc>, <Esc>:w<CR>

"   shortcut to <C-o>O because it often cause IME on (annoying...)
" inoremap <Esc>o <C-o>O

"   execute current buffer by each filetype
inoremap <silent> <F3> <ESC>:w<CR>:make -c %<CR>:cw<CR>:cfirst<CR>zz
inoremap <silent> <F2> <ESC>:w<ENTER>:call EvalVsplit(GetShebangExecute())<CR>

"   set paste mode
"   TODO: examine the way to turn paste mode off by a mapping
inoremap <silent> <F10> <Esc>:set paste<CR>:set paste?<CR>a


"  Visual Mode  {{{2
" ==================================================

"   copy to clipboard
vnoremap <C-y> "+y

"   evaluate vim expression
vnoremap <Leader>e y:@"<CR>

"   indent
" vnoremap <Tab>   >gv
" vnoremap <S-Tab> <gv

"   Align.vim
vnoremap <C-a> :AlignFixed<Space>

"  Commandline Mode  {{{2
" ==================================================

"   cursor move like emacs
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <C-a>  <Home>
cnoremap <C-e>  <End>

"   go forward history
cnoremap <C-n> <Down>
"   go backward history
cnoremap <C-p> <Up>

"   delete if not at the end of line
cnoremap <expr> <C-d> (getcmdpos()==strlen(getcmdline())+1 ? "\<C-d>" : "\<Del>")

"   make easy to type / in search
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
"   like Emacs
cnoremap <expr> <C-k> DeleteUntilEndOfLine()


" ===============================================================================
"   Plugins   {{{1
" ===============================================================================

"   lightline.vim  {{{2
" ==================================================

let g:lightline = {
\   'colorscheme': 'jellybeans',
\   'active': {
\     'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
\   },
\   'separator': { 'left': "\u2b80", 'right': "\u2b82" },
\   'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
\   'mode_map': {'c': 'NORMAL'},
\   'component': {
\     'readonly': '%{ &readonly ? "⭤" : "" }',
\   },
\   'component_function': {
\     'modified': 'MyModified',
\     'readonly': 'MyReadonly',
\     'fugitive': 'MyFugitive',
\     'filename': 'MyFilename',
\     'fileformat': 'MyFileformat',
\     'filetype': 'MyFiletype',
\     'fileencoding': 'MyFileencoding',
\     'mode': 'MyMode'
\   }
\ }

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
   return fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction


"   migemo.vim  {{{2
" ==================================================

if has('migemo')
  set migemo
else
  let g:migemodict = '/usr/local/share/migemo/euc-jp/migemo-dict'
  nnoremap <silent> g/ :Migemo<CR>
endif


"   yankring.vim  {{{2
" ==================================================
"   Whether we should map the . operator
let g:yankring_map_dot = 0
"   Whether we should map the "g" paste operators
let g:yankring_paste_using_g = 0
"
let g:yankring_history_file = '.yankring_history'

"   Remap key mappings to go forward and backward between the yankring history
let g:yankring_replace_n_pkey = '<Esc>k'
let g:yankring_replace_n_nkey = '<Esc>j'


"   neocomplcache.vim  {{{2
" ==================================================

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Performance issue
let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_manual_completion_start_length = 3
let g:neocomplcache_min_syntax_length = 4
let g:neocomplcache_min_keyword_length = 4
" number of candidates
let g:neocomplcache_max_list = 10
" Use ignore
let g:neocomplcache_enable_ignore_case = 1
" Smart case
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 0
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 0
" Set minimum syntax keyword length.
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
  \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
" not japanese word to completion candidates
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

let g:neocomplcache_plugin_disable = {
  \ 'syntax_complete' : 1, 
  \ }
" avoid to be taken completefunc by other plugins
let g:neocomplcache_force_overwrite_completefunc = 1

"   neosnippet.vim  {{{2
" ==================================================

let g:neosnippet#snippets_directory = basedir . 'snippets'

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1


"   unite.vim  {{{2
" ==================================================

let g:unite_enable_start_insert = 1
" Set to empty cause speed up unite displaying
let g:unite_source_file_mru_filename_format = ""
" Enalbe history/yank
let g:unite_source_history_yank_enable = 1
" file_mru limits for quick start
let g:unite_source_file_mru_limit = 1000

" Grep
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" the silver searcher
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif


" Unite from ex command output
command! -nargs=1 -complete=command UniteExCommand Unite output:<args>


augroup Unite
  autocmd!
  autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('above')
  autocmd FileType unite inoremap <silent> <buffer> <expr> <C-s> unite#do_action('above')
  autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('below')
  autocmd FileType unite inoremap <silent> <buffer> <expr> <C-v> unite#do_action('below')
  autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabopen')
  autocmd FileType unite inoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabopen')
  " file browse
  autocmd FileType unite nnoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
  autocmd FileType unite inoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
  autocmd FileType unite nnoremap <silent><buffer><expr> <C-l> unite#do_action('vimfiler')
  autocmd FileType unite inoremap <silent><buffer><expr> <C-l> unite#do_action('vimfiler')
  " narrowing
  autocmd FileType unite imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
  autocmd FileType unite nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
  " Fix to <Left>, <Right> from <Plug>(unite_select_previous_page), <Plug>(unite_select_next_page)
  autocmd FileType unite inoremap <silent> <buffer> <C-b> <Left>
  autocmd FileType unite inoremap <silent> <buffer> <C-f> <Right>
  autocmd FileType unite imap     <silent> <buffer> <C-w> <Plug>(unite_delete_backward_path)
  autocmd FileType unite imap     <silent> <buffer> <C-Space> <Plug>(unite_narrowing_path)

  " hit <ESC> twice to exit Unite
  autocmd FileType unite nnoremap <silent> <buffer> <ESC> :q<cr>
  autocmd FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<cr>
augroup END


"   vimfiler.vim  {{{2
" ==================================================

let g:vimfiler_safe_mode_by_default = 0

augroup vimfiler
  autocmd!
  " autocmd FileType vimfiler nmap <buffer> q <Plug>(vimfiler_exit)
  " autocmd FileType vimfiler nmap <buffer> Q <Plug>(vimfiler_hide)
  autocmd FileType vimfiler nnoremap <buffer><silent>/
    \ :<C-u>Unite line<CR>
augroup END


"   quickrun.vim   {{{2
" ==================================================

" right bottom side of horizontal split, and its height is 20 lines size
let g:quickrun_config = {
\   "_" : {
\       "outputter/buffer/split" : ":botright 20sp",
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 40,
\   },
\}


"   NERD_commenter.vim  {{{2
" ==================================================
"
"   add space between comment delimiters
let NERDSpaceDelims = 1
"   remove warning not to be able to handle a filetype
let NERDShutUp = 1


"   Align.vim   {{{2
" ==================================================
let g:Align_xstrlen = 3

"   reset setting of :AlignCtrl
command! -nargs=0 AlignReset call Align#AlignCtrl("default")

"   Fix the bug in Align.vim version 35
"   to move cursor to an unintended position after Align command.
function! s:AlignFixed(...) range
  let l:sep = a:0 > 0 ? a:1 : ''
  execute "'<,'>Align " . l:sep
  silent undo
  silent redo
endfunction

command! -nargs=? -range -bar AlignFixed
\ call s:AlignFixed(<f-args>)

"   align for only the first seprator
function! s:AlignFirstMatch(...)
  AlignCtrl l:
  execute 'AlignFixed' a:0 > 0 ? a:1 : ''
  AlignReset
endfunction

command! -nargs=? -range AlignFirstMatch
\ call s:AlignFirstMatch(<f-args>)


"   taglist.vim   {{{2
" ==================================================
"   automatically close the tags tree for inactive files
let Tlist_File_Fold_Auto_Close = 1
"   Increase window width when open a new taglist window
let Tlist_Inc_Winwidth = 0
"   disable to display vim fold column in the taglist window
let Tlist_Enable_Fold_Column = 0


"   cocoa.vim   {{{2
"   <Leader>A - Alternate between header (.h) and implementation (.m) file
"   K         - Look up documentation for word under cursor[1]
"   <d-m-up>  - <Leader>A
"   <d-r>     - Build & Run (Go)
"   <d-cr>    - CMD-R
"   <d-b>     - Build
"   <shift-k> - Clean
"   <d-0>     - Go to Project
"   <d-2>     - :ListMethods
"   <F5> (insert mode) - Show omnicompletion menu
"   <d-/>     - Comment out line
"   <d-[>     - Decrease indent
"   <d-]>     - Increase indent
" ==================================================

" disable key mapping 'K' to invoke man to the word on which current cursror is
let objc_man_key = ''


"   vimclojure.vim   {{{2
" ==================================================



"   sonictemplate.vim   {{{2
" ==================================================

let g:sonictemplate_vim_template_dir = [
\     basedir . 'template'
\   ]


"   smartinput.vim   {{{2
" ==================================================

"   smart space and enter with parenthesis

"   ()
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#define_rule({
\   'at'    : '(\%#)',
\   'char'  : '<Space>',
\   'input' : '<Space><Space><Left>',
\ })
call smartinput#define_rule({
\   'at'    : '( \%# )',
\   'char'  : '<BS>',
\   'input' : '<Del><BS>',
\ })

call smartinput#map_to_trigger('i', '<CR>', '<CR>', '<CR>')
call smartinput#define_rule({
\   'at'    : '(\%#)',
\   'char'  : '<CR>',
\   'input' : '<CR><CR><Up><Tab>',
\ })
call smartinput#define_rule({
\   'at'    : '(\n\s*\%#\n\s*)',
\   'char'  : '<BS>',
\   'input' : '<Esc>ddd0i<C-u><BS>',
\ })

"   {}
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#define_rule({
\   'at'    : '{\%#}',
\   'char'  : '<Space>',
\   'input' : '<Space><Space><Left>',
\ })
call smartinput#define_rule({
\   'at'    : '{ \%# }',
\   'char'  : '<BS>',
\   'input' : '<Del><BS>',
\ })

call smartinput#map_to_trigger('i', '<CR>', '<CR>', '<CR>')
call smartinput#define_rule({
\   'at'    : '{\%#}',
\   'char'  : '<CR>',
\   'input' : '<CR><CR><Up><Tab>',
\ })
call smartinput#define_rule({
\   'at'    : '{\n\s*\%#\n\s*}',
\   'char'  : '<BS>',
\   'input' : '<Esc>ddd0i<BS>',
\ })

"   []
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#define_rule({
\   'at'    : '\[\%#\]',
\   'char'  : '<Space>',
\   'input' : '<Space><Space><Left>',
\ })
call smartinput#define_rule({
\   'at'    : '\[ \%# \]',
\   'char'  : '<BS>',
\   'input' : '<Del><BS>',
\ })

call smartinput#map_to_trigger('i', '<CR>', '<CR>', '<CR>')
call smartinput#define_rule({
\   'at'    : '\[\%#\]',
\   'char'  : '<CR>',
\   'input' : '<CR><CR><Up><Tab>',
\ })
call smartinput#define_rule({
\   'at'    : '\[\n\s*\%#\n\s*\]',
\   'char'  : '<BS>',
\   'input' : '<Esc>ddd0i<BS>',
\ })


" ===============================================================================
"   Settings for Japanese   {{{1
" ===============================================================================

"   fileformats
set fileformats=unix,dos,mac

set encoding=utf-8
" set encoding=japan

"   automatically detect fileencoding
"   from http://github.com/kana/config
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'

  " Does iconv support JIS X 0213 ?
  if iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213,euc-jp'
    let s:enc_jis = 'iso-2022-jp-3'
  endif

  " Make fileencodings
  let &fileencodings = 'ucs-bom'
  if &encoding !=# 'utf-8'
    let &fileencodings = &fileencodings . ',' . 'ucs-2le'
    let &fileencodings = &fileencodings . ',' . 'ucs-2'
  endif
  let &fileencodings = &fileencodings . ',' . s:enc_jis

  if &encoding ==# 'utf-8'
    let &fileencodings = &fileencodings . ',' . s:enc_euc
    let &fileencodings = &fileencodings . ',' . 'cp932'
  elseif &encoding =~# '^euc-\%(jp\|jisx0213\)$'
    let &encoding = s:enc_euc
    let &fileencodings = &fileencodings . ',' . 'utf-8'
    let &fileencodings = &fileencodings . ',' . 'cp932'
  else  " cp932
    let &fileencodings = &fileencodings . ',' . 'utf-8'
    let &fileencodings = &fileencodings . ',' . s:enc_euc
  endif
  let &fileencodings = &fileencodings . ',' . &encoding

  unlet s:enc_euc
  unlet s:enc_jis
endif


" ===============================================================================
"   Commands   {{{1
" ===============================================================================

"   rename the filename of the current buffer and delete the old one
command! -nargs=1 -complete=file Rename
\ file <args>|call delete(expand('#'))


"   (re)open a file with specific filleencoding
command! -bang -bar -complete=file -nargs=? Cp932
\ edit<bang>  ++enc=cp932 <args>
command! -bang -bar -complete=file -nargs=? Eucjp
\ edit<bang>  ++enc=euc-jp <args>
command! -bang -bar -complete=file -nargs=? Utf8
\ edit<bang>  ++enc=utf-8 <args>
command! -bang -bar -complete=file -nargs=? Iso2022jp
\ edit<bang>  ++enc=iso-2022-jp <args>

command! -bang -bar -complete=file -nargs=? Jis Iso2022jp<bang> <args>
command! -bang -bar -complete=file -nargs=? Sjis Cp932<bang> <args>


"   escape HTML entities
command! -bang -range HtmlEntities :'<,'>!html-entities.pl


"   vimgrep in current buffer
command! -bar -nargs=1 -complete=customlist,s:complete_from_currentbuffer VimgrepInCurrentBuffer
\ vimgrep <args> %:p
"   vimgrep in current directory downward recursively
command! -bar -nargs=1 -complete=customlist,s:complete_from_currentbuffer VimgrepInCurrentDir
\ vimgrep <args> **/*
command! -nargs=+ -complete=file VGrep
\ call s:grep([<f-args>])

function! s:grep(args)
  execute 'vimgrep' '/'.a:args[-1].'/' join(a:args[:-2])
endfunction


"   shortcut commands to echo with highlight
command! -bar -nargs=+ EchoHi      call s:cmd_Hecho('echo', [<f-args>])
command! -bar -nargs=+ EchonHi     call s:cmd_Hecho('echon', [<f-args>])
command! -bar -nargs=+ EchomsgHi   call s:cmd_Hecho('echomsg', [<f-args>])


"   Update tag file
command! -nargs=? -complete=dir CtagsUpdate
\ execute '!ctags' '-R ' . ( !empty(<q-args>) ? ' -f <args>/tags' : '' )


"   Display all list of snippets for current filetype
command! -bar ListSnippets  call s:ListSnippets()
function! s:ListSnippets()
  if !exists('*GetSnipsInCurrentScope')
    return
  endif

  let snippets = GetSnipsInCurrentScope()
  for key in sort( keys(snippets) )
    execute 'EchoHi' 'Label' string(key)
    echo "\n\t" . join( split(snippets[key], "\n"), "\n\t" )
    echo
  endfor
endfunction


" ===============================================================================
"   Events (autocmd)   {{{1
" ===============================================================================

augroup Quickfix
  "   Remove ALL autocommands for the current group.
  autocmd!
  "   open automatically quickfix or location-list window
  "   when run commands such as make, grep, etc...
  autocmd QuickfixCmdPost [^l]*       copen
  autocmd QuickfixCmdPost l*          lopen
augroup END

augroup CommandLine
  autocmd!
  "   reset <CR> to default behavior
  autocmd CmdwinEnter     *           nnoremap <buffer> <CR> <CR>
augroup END

"   use as ':setf js'
augroup FileTypeAbbrev
  autocmd!

  autocmd FileType ap setlocal ft=apache
  autocmd FileType js setlocal ft=javascript
  autocmd FileType pl setlocal ft=perl
augroup END


" ===============================================================================
"   Functions   {{{1
" ===============================================================================


"   input one charracter with keeping on normal mode
" --------------------------------------------------
function! s:insert_one_character()
  EchoHi ModeMsg '-- INSERT (one char) --'
  return nr2char(getchar()) . "\<Esc>"
endfunction


"   return list of words in current buffer
" --------------------------------------------------
function! s:complete_from_currentbuffer(ArgLead, CmdLine, CursorPos)
  "   using dicrectory for avoid deduped item
  let candidates = {}
  let lines = getbufline('%', 1, '$')
  for line in lines
    for word in split(line, '\W\+')
      let candidates[word] = 1
    endfor
  endfor
  let compList = filter(keys(candidates), 'v:val =~# "^" . a:ArgLead')
  return compList
endfunction


"   echo with highlight
" --------------------------------------------------
function! s:cmd_Hecho(echo_command, args)
  let highlight_name = a:args[0]
  let messages       = a:args[1:]

  execute 'echohl' highlight_name
  execute a:echo_command join(messages)
  echohl None
endfunction


"   like LongLongLongLongLongLongLong => LongLong......LongLong
" --------------------------------------------------
function! SnipMid(str, len, mask)
  if a:len >= len(a:str)
    return a:str
  elseif a:len <= len(a:mask)
    return a:mask
  endif

  let len_head = (a:len - len(a:mask)) / 2
  let len_tail = a:len - len(a:mask) - len_head

  return (len_head > 0 ? a:str[: len_head - 1] : '') . a:mask . (len_tail > 0 ? a:str[-len_tail :] : '')
endfunction


"   Delete from current cursor position to the end of line
" --------------------------------------------------
function! DeleteUntilEndOfLine()
  let num = strlen(getcmdline()) - getcmdpos() + 1
  return repeat("\<Del>", num)
endfunction


"   get command name from shebang otherwise filetype.
" --------------------------------------------------
function! GetShebangExecute()
  let m = matchlist(getline(1), '#!.*/?\(.*\)')
  if (len(m) > 2)
    return m[1]
  else
    return &ft
  endif
endfunction


"   preview interpreter's output. refer to:
"   http://blog.blueblack.net/item_150
" --------------------------------------------------
function! EvalVsplit(cmd) range
  let src = tempname()
  let dst = a:cmd . "-output"
  let start = a:firstline
  let end   = a:lastline
  if (start == end)
    let start = 1
    let end = '$'
  endif

  " put current buffer's content in a temp file
  silent execute ": " . start . "," . end . "w " . src
  " open the preview window
  silent execute ":pedit! " . dst
  " change to preview window
  wincmd P
  " set options
  setlocal buftype=nofile
  setlocal noswapfile
  setlocal syntax=none
  setlocal bufhidden=delete
  " replace current buffer with ruby's output
  silent execute ":%!" . a:cmd . " " . src . " 2>&1 "
  " change back to the source buffer
  wincmd p
endfunction


"  send a last text yanked to windows clipboard.
" --------------------------------------------------
function! SyncClipboard()
  let cliptext = substitute(getreg(), "'", "'\"'\"'", "g")
  let cmd = "echo '" . cliptext . "' | clsync.py"
  call system(cmd)
endfunction


"   return my customized string for tabline
" --------------------------------------------------
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    "   if tab is active
    if i + 1 == tabpagenr()
        let s .= '%#TAbLineSel#'
    else
        let s .= '%#TabLine#'
    endif
    "   set tabpage number
    let s .= '%' . (i+1) . 'T'
    "   generate each tab label
    let s .= '' . (i+1) . ' %{MyTabLabel(' . (i+1) . ')} '
  endfor
  let s .= '%#TabLineFill#%T'
  "   fill with TabLineFill and reset tabpage number
  return s
endfunction

function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr   = tabpagewinnr(a:n)
  let label   = fnamemodify(bufname(buflist[winnr-1]), ':t')
  let label   = label != "" ? label : 'NONAME'
  return label
endfunction


" ===============================================================================
"   Source external files   {{{1
" ===============================================================================

"   vimrc.local
if filereadable (expand("~/.vimrc.local"))
  source ~/.vimrc.local
elseif filereadable (expand($VIM . "/.vimrc.local"))
  source $VIM/.vimrc.local
endif

"   Load .vimrc-local by per directory upward hierarchically.
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc-local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction


" ===============================================================================
" End {{{1
" ===============================================================================

"   must be written at the end. refer to  ':help secure'
set secure

" vim: expandtab softtabstop=2 shiftwidth=2
" vim: set foldmethod=marker
