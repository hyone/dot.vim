" Vim syntax file
" Language        : zumplate
" Maintainer      : yonekubo
" URL             : http://www.syun.jp/
" Last change     : 2009 Aug 28

" require version > 600

if !exists("main_syntax")
  let main_syntax = 'zumplate'
endif

runtime! syntax/html.vim
unlet b:current_syntax

" Next syntax items are case-sensitive
syn case match

" Include JavaScript syntax
syn include @zplJavaScript syntax/javascript.vim

syn region zplScriptlet           matchgroup=zplTag start=/<%/      keepend end=/%>/      contains=@zplJavaScript
syn region zplExprDirective       matchgroup=zplTag start=/\${/rs=e keepend end=/}/re=s   contains=@zplJavaScript

syn region zplHtmlString          start=+"+ end=+"+ contains=zplExprDirective,htmlSpecialChar,javaScriptExpression,@htmlPreproc
syn region  mobileKeyword         start=/\[\[/ end=/\]\]/

" Redefine htmlTag so that it can contain zplExprDirective
syn region htmlTag     start=+<[^/%]+ end=+>+ keepend contains=htmlTagN,zplHtmlString,zplExprDirective,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster
syn region htmlComment start=+<!--[^#]+  keepend end=+--\s*>+
syn region htmlComment start=+<!DOCTYPE+ keepend end=+>+

" Define the default highlighting.
" For version 5.8 and later: only when an item doesn't have highlighting yet
command -nargs=+ HiLink hi def link <args>

" Be consistent  with html highlight settings
HiLink zplTag                   htmlSpecial
HiLink zplHtmlString            htmlString
HiLink zplCommandName           htmlTagName
HiLink mobileKeyword            htmlTag
delcommand HiLink

if main_syntax == 'zumplate'
  unlet main_syntax
endif

let b:current_syntax = "zumplate"

" vim: ts=8
