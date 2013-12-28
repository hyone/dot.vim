setlocal makeprg=jsl\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -process\ $*
setlocal errorformat=%f(%l):\ %m

if !exists("g:javascript_flyquickfixmake")
  let g:javascript_flyquickfixmake = 1
  " autocmd BufWritePost *.js silent make %
endif
