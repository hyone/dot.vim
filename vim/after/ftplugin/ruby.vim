"   Key Mappings   {{{1
" ===============================================================================

" inoremap <buffer> \| \|\|<Left>

nnoremap <silent><buffer> <LocalLeader>m :Rmodel<CR>
nnoremap <silent><buffer> <LocalLeader>c :Rcontroller<CR>
nnoremap <silent><buffer> <LocalLeader>v :Rview<CR>
nnoremap <silent><buffer> <LocalLeader>u :Runittest<CR>

" vim-rspec
nnoremap <silent><buffer> <LocalLeader>r  :RunSpec<CR>
nnoremap <silent><buffer> <LocalLeader>rr :RunSpec<CR>
nnoremap <silent><buffer> <LocalLeader>rl :RunSpecLine<CR>


"   vim-smartinput  {{{1
" ===============================================================================

"   {|| ... }
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#define_rule({
\   'at' : '{\s*|[^|]*|\%#}',
\   'char'  : '<Space>',
\   'input' : '<Space><Space><Left>',
\   'filetype' : ['ruby'],
\ })
call smartinput#define_rule({
\   'at' : '{\s*|[^|]*| \%# }',
\   'char'  : '<BS>',
\   'input' : '<Del><BS>',
\   'filetype' : ['ruby'],
\ })

call smartinput#map_to_trigger('i', '<CR>', '<CR>', '<CR>')
call smartinput#define_rule({
\   'at' : '{\s*|[^|]*|\s*\%#\s*}',
\   'char'  : '<CR>',
\   'input' : ' <Esc>gEa<CR><CR><Up><Tab>',
\   'filetype' : ['ruby'],
\ })
call smartinput#define_rule({
\   'at' : '{\s*|[^|]*|\s*\n\s*\%#\s*\n\s*}',
\   'char'  : '<BS>',
\   'input' : '<Esc>ddd0i<BS>',
\   'filetype' : ['ruby'],
\ })

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
