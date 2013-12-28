function! operator#format_seq#normal(motion_wise)
  let visual_command = operator#user#visual_command_from_wise_name(a:motion_wise)
  execute 'normal!' '`['.visual_command.'`]'

  "   using 'v' register to copy the text in the selected region
  let oldreg = getreg('v')

  execute 'normal!' '"vd'
  let content = getreg('v')
  let content = substitute(content, '\s*,\s*\n\s*', ", ", "g")

  "   For if there is not "," after last element
  let content = substitute(content, '\s*\n\s*$', " ", "")
  "   For first element
  let content = substitute(content, '^\s*', "", "")
  "
  call setreg('v', content)
  execute 'normal' '"vP'
  " remove first new line
  execute 'normal' "I\<C-h>\<Space>\<Esc>"

  call setreg('v', oldreg)
endfunction

function! operator#format_seq#oneline(motion_wise)
  let visual_command = operator#user#visual_command_from_wise_name(a:motion_wise)
  execute 'normal!' '`['.visual_command.'`]'

  "   using 'v' register to copy the text in the selected region
  let oldreg = getreg('v')

  execute 'normal!' '"vd'
  let indent  = s:makeSpace(&shiftwidth + indent("."))
  let content = getreg('v')
  let content = substitute(content, '^\s*', "", "")
  let content = substitute(content, '\s*$', "", "")
  "   For if there is "," after last element
  let content = substitute(content, '\n\s*$', "", "")
  "   For first element
  let content = "\n" . indent . content
  call setreg('v', content)
  execute 'normal' '"vP' . "%i\<CR>\<C-h>\<Esc>l"

  call setreg('v', oldreg)
endfunction

function! operator#format_seq#each(motion_wise)
  let visual_command = operator#user#visual_command_from_wise_name(a:motion_wise)
  execute 'normal!' '`['.visual_command.'`]'

  "   using 'v' register to copy the text in the selected region
  let oldreg = getreg('v')

  execute 'normal!' '"vd'
  let indent  = s:makeSpace(&shiftwidth + indent("."))
  let content = getreg('v')
  let content = substitute(content, '^\s*', "", "")
  let content = substitute(content, '\s*$', "", "")
  let content = substitute(content, ',\s*', ",\n" . indent, "g")
  "   For if there is "," after last element
  let content = substitute(content, '\n\s*$', "", "")
  "   For first element
  let content = "\n" . indent . content
  call setreg('v', content)
  execute 'normal' '"vP' . "%i\<CR>\<C-h>\<Esc>l"

  call setreg('v', oldreg)
endfunction


function! s:makeSpace(num)
  let num = a:num
  let str = ""
  while num > 0
    let str = str . " "
    let num -= 1
  endwhile
  return str
endfunction
