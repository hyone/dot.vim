" Vim color scheme
"
" Name:         darkneon.vim
" Maintainer:   hyone <hyone.development@gmail.com>
"
" Customize darkneon.vim to display approximinate colorscheme on
" vim + guicolorscheme.vim, and in terminal.


set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "darkneon256"

highlight link                      htmlTag         xmlTag
highlight link                      htmlTagName     xmlTagName
highlight link                      htmlEndTag      xmlEndTag

"   Default Colors
highlight Normal                    guifg=#c0c0c0   guibg=#333333
highlight NonText                   guifg=#777777   guibg=#333333
highlight Cursor                    guifg=#000000   guibg=#ff8c00
highlight lCursor                   guibg=#000000   guibg=#ff8c00
" 日本語入力ON時のカーソルの色を設定 
if has('multi_byte_ime') || has('xim')
    highlight Cursor                guifg=#000000   guibg=#ff8c00 gui=NONE
    highlight CursorIM              guifg=#ffffff   guibg=#9f79ee gui=NONE
endif
highlight CursorLine                gui=NONE

"   Window Elements
highlight StatusLine                guifg=#ff8800 guibg=#000000 gui=NONE
highlight StatusLineNC              guifg=#000000 guibg=#999999
highlight VertSplit                 guifg=#444444 guibg=#444444
highlight Folded                    guifg=#111111 guibg=#8090a0
highlight IncSearch                 guifg=white   guibg=#5A647E gui=underline
highlight Search                    guifg=white   guibg=#5A647E gui=underline

"   TabLine
highlight TabLine                   guifg=#ffffff guibg=#000000 gui=NONE
highlight TabLineSel                guifg=#ff8800 guibg=#000000
highlight TabLineFill               guifg=#000000 guibg=#000000

"   color for popup menu
highlight Pmenu                     guibg=#24272a guifg=#c2c2c2
highlight PmenuSel                  guibg=#ee7600 guifg=#ffffff
highlight PmenuSbar                 guibg=#36393d

highlight Comment                   guifg=#333333 guibg=#8b7e66 | "gui=italic
"988a70 (x1.1) a6977a (x1.2)
highlight Constant                  guifg=#6D9CBE
highlight Define                    guifg=#7b8fde
" highlight Define                    guifg=#ff8800
highlight Error                     guifg=#c0c0c0   guibg=#99000
highlight Function                  guifg=#6ea3ff   gui=NONE
highlight Identifier                guifg=#81d681   gui=NONE
highlight Include                   guifg=#ee7621   gui=underline
highlight Keyword                   guifg=#ee7621
highlight LineNr                    guifg=#c0c0c0   guibg=#24272a
highlight Number                    guifg=#7b8fde
highlight PreProc                   guifg=#c0c0c0
highlight Statement                 guifg=#ff8800   gui=NONE 
highlight String                    guifg=#ffcccc   guibg=#000000
" highlight Title                     guifg=#c0c0c0
highlight Title                     guifg=#ffffff
highlight Type                      guifg=#81d681   gui=NONE
highlight Visual                    guibg=#5A647E
highlight SpecialKey                guifg=#48547f   guibg=#121416   gui=underline | "48545f
" ZenkakuSpace
highlight ZenkakuSpace              guifg=#48547f   guibg=#36393d   gui=underline
match     ZenkakuSpace              /　/
highlight MatchParen                guifg=#c0c0c0   guibg=#4876ff

highlight DiffAdd                   guifg=#d7ffaf   guibg=#5f875f
highlight DiffChange                guifg=#d7d7ff   guibg=#5f5f87
highlight DiffDelete                guifg=#000000   guibg=#d75f5f
highlight DiffText                  guifg=#000000   guibg=#5f87d7


highlight xmlTag                    guifg=#E8BF6A
highlight xmlTagName                guifg=#E8BF6A
highlight xmlEndTag                 guifg=#E8BF6A

"   candidates of colors
"   Python
highlight rubyDelimEscape           guifg=#99cccc
highlight rubyNestedParentheses     guifg=#99ccff
highlight rubyNestedCurlyBraces     guifg=#9999ff
highlight rubyNestedAngleBrackets   guifg=#ccccff
highlight rubyNestedSquareBrackets  guifg=#ffccff
highlight rubyRegexpParens          guifg=#cc99ff
highlight rubyRegexpBrackets        guifg=#ff99ff
highlight rubyLocalVariableOrMethod guifg=#ffffcc
highlight rubyBlockArgument         guifg=#ffff99
highlight rubyBlockParameterList    guifg=#99cc99
highlight rubyHeredocStart          guifg=#cc9966
highlight rubyAliasDeclaration2     guifg=#999966
highlight rubyAliasDeclaration      guifg=#996699
highlight rubyMethodDeclaration     guifg=#9999cc
highlight rubyClassDeclaration      guifg=#6699cc
highlight rubyModuleDeclaration     guifg=#6666cc
highlight rubyBlock                 guifg=#cc9900
highlight rubyDoBlock               guifg=#cc6600
highlight rubyCurlyBlock            guifg=#ff9900
highlight rubyArrayDelimiter        guifg=#ff6600
highlight rubyArrayLiteral          guifg=#336666
