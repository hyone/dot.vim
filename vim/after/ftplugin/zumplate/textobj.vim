" Include Guard {{{1
if exists('g:loaded_textobj_zumplate')
  finish
endif


" Register  {{{1
call textobj#user#plugin('indent', {
\      '-': {
\        '*sfile*': expand('<sfile>:p'),
\        'select-a': 'ad',  '*select-a-function*': 's:select_a',
\        'select-i': 'id',  '*select-i-function*': 's:select_i',
\      }
\    })


" Main  {{{1
function! s:select_a()
  let c = v:count1
  let range = s:function_range()

  if type(range) == type([])
    let type = 'v'
    call setpos('.', range[0])
    if col('.') == 1 || getline('.')[:col('.') - 2] =~ '^\s*$'
      call setpos('.', range[1])
      if getline('.')[col('.'):] =~ '^\s*$'
        let type = 'V'
      endif
    endif
    let range = [type] + range
  endif
  return range
endfunction


function! s:select_i()
  let range = s:select_a()
  if type(range) == type(0)
    return 0
  endif

  let type = 'v'

  let endpos = range[2]
  call setpos('.', endpos)

  let linewise = 0
  if col('.') == 1 || getline('.')[:col('.') - 2] =~ '^\s*$'
    normal! k$
  let linewise = 1
  else
    call s:left()
  endif
  let e = getpos('.')

  let startpos = range[1]
  call setpos('.', startpos)

  if getline('.')[col('.') + 2:] =~ '^\s*$'
    normal! j0
    if linewise
      let type = 'V'
    endif
  else
    normal! l
  endif
  let b = getpos('.')

  return [type, b, e]
endfunction


function! s:function_range()
  let start = getpos('.')
  if search('<%', 'bcW') == 0
    return 0
  endif
  let b = getpos(".")
  if search('%>', 'eW') == 0
    return 0
  endif
  let e = getpos(".")
  if (e[1] < start[1] || (e[1] == start[1] && e[2] < start[2]))
    return 0
  endif
  return [b, e]
endfunction


function! s:cursor_char()
  return getline('.')[col('.') - 1]
endfunction


function! s:left()
  if col('.') == 1
    if line('.') != 1
      normal! k$
    endif
  else
    normal! h
  endif
endfunction



" Fin.  "{{{1

" let g:loaded_textobj_zumplate = 1
