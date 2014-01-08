"   Note:
"     setfiletype:        apply the filetype specified if vim default detection don't guess filetype
"     set filetype=hoge:  apply forcely the filetype specified.

"   AutoHotKey
autocmd BufNewFile,BufRead *.ahk        set filetype=ahk
"   Template-Toolkit
autocmd BufNewFile,BufRead  *.tt        set filetype=tt2
autocmd BufNewFile,BufRead  *.tt2       set filetype=tt2
"   Scala
autocmd BufRead,BufNewFile  *.scala     set filetype=scala
"   ActionScript
autocmd BufRead,BufNewFile  *.as        set filetype=actionscript
"   zumplate
autocmd BufRead,BufNewFile  *.zpl       set filetype=zumplate
"   JSON.vim
autocmd BufRead,BufNewFile *.json       set filetype=json
