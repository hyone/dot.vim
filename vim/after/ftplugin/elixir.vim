
"   vivi.vim  {{{1
" ===============================================================================

let g:vivi_enable_auto_syntax_checking = 1

"   Warming up IEx helps you get quick response in viewing reference or omni completion.
let g:vivi_enable_auto_warm_up_iex = 1

" let g:vivi_enable_omni_completion = 1
setlocal omnifunc=vivi#complete#omni

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.elixir = '[^.[:digit:] *\t]\.'


"   vim-smartinput  {{{1
" ===============================================================================

"   do ... end
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#define_rule({
\   'at'    : '\(\_^\|\t\| \)do\%#end\(\n\|\r\|\t\| \)',
\   'char'  : '<Space>',
\   'input' : '<Space><Space><Left>',
\ })
call smartinput#define_rule({
\   'at'    : '\(\_^\|\t\| \)do \%# end\(\n\|\r\|\t\| \)',
\   'char'  : '<BS>',
\   'input' : '<Del><BS>',
\ })

call smartinput#map_to_trigger('i', '<CR>', '<CR>', '<CR>')
call smartinput#define_rule({
\   'at'    : '\(\_^\|\t\| \)do\(\s*|[^|]*|\)\?\s*\%#\s*end\(\n\|\r\|\t\| \)',
\   'char'  : '<CR>',
\   'input' : ' <Esc>gEa<CR><CR><Up><Tab>',
\ })
call smartinput#define_rule({
\   'at'    : '\(\_^\|\t\| \)do\n\s*\%#\n\s*end\(\n\|\r\|\t\| \)',
\   'char'  : '<BS>',
\   'input' : '<Esc>ddd0i<BS>',
\ })

"   -> ... end
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#define_rule({
\   'at'    : '\(\_^\|\t\| \)->\%#end\(\n\|\r\|\t\| \)',
\   'char'  : '<Space>',
\   'input' : '<Space><Space><Left>',
\ })
call smartinput#define_rule({
\   'at'    : '\(\_^\|\t\| \)-> \%# end\(\n\|\r\|\t\| \)',
\   'char'  : '<BS>',
\   'input' : '<Del><BS>',
\ })

call smartinput#map_to_trigger('i', '<CR>', '<CR>', '<CR>')
call smartinput#define_rule({
\   'at'    : '\(\_^\|\t\| \)->\(\s*|[^|]*|\)\?\s*\%#\s*end\(\n\|\r\|\t\| \)',
\   'char'  : '<CR>',
\   'input' : ' <Esc>gEa<CR><CR><Up><Tab>',
\ })
call smartinput#define_rule({
\   'at'    : '\(\_^\|\t\| \)->\n\s*\%#\n\s*end\(\n\|\r\|\t\| \)',
\   'char'  : '<BS>',
\   'input' : '<Esc>ddd0i<BS>',
\ })
