"   Note:
"     setfiletype:        apply the filetype specified if vim default detection don't guess filetype
"     set filetype=hoge:  apply forcely the filetype specified.

"   AutoHotKey
autocmd BufNewFile,BufRead *.ahk        setfiletype ahk
"   Template-Toolkit
autocmd BufNewFile,BufRead  *.tt        setfiletype tt2
autocmd BufNewFile,BufRead  *.tt2       set filetype=tt2
"   Scala
autocmd BufRead,BufNewFile  *.scala     setfiletype scala
"   ActionScript
autocmd BufRead,BufNewFile  *.as        set filetype=actionscript
"   Plack/PSGI
autocmd BufRead,BufNewFile  *.psgi      set filetype=perl
"   zumplate
autocmd BufRead,BufNewFile  *.zpl       set filetype=zumplate
"   JSON.vim
autocmd BufRead,BufNewFile *.json       set filetype=json
