"   override the vimfiler default keymappings
nnoremap <buffer><silent> H               gT<CR>
"   backup default behavior of 'H' to other keymap
nmap     <buffer><silent> <LocalLeader>h  <Plug>(vimfiler_popup_shell)
nnoremap <buffer><silent> L               :TabNextRelative<CR>
