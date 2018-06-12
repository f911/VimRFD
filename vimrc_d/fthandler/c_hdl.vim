" $MYVIMFTH/vim_hdl.vim 
" Recommend keymap layout on Fn area.
"
"   +--+   +--+   +--+   +--+   +--+   +--+   +--+   +--+   +--+   +--+   +--+   +--+ 
"  ||F1|| ||F2|| ||F3|| ||F4|| ||F5|| ||F6|| ||F7|| ||F8|| ||F1|| ||F2|| ||F3|| ||F4||
"  |/__\| |/__\| |/__\| |/__\| |/__\| |/__\| |/__\| |/__\| |/__\| |/__\| |/__\| |/__\|
"  .                         . .                         . .                         .
"  '^=====[ Vim Global]=====^' '^=[ Environment Local ]=^' '^=[ Desktop Universal ]=^'
"
"  F1: Help(vim help)               C-F1:
"  F2: FileExplorer(NerdTreeToggle) C-F2:
"  F3: Outlines(TargbarToggle)      C-F3:
"  F4:                              C-F4:
"
"  F5: Help(vim help)
"  F7: FileExplorer(NerdTreeToggle)
"  F8: Outlines(TargbarToggle)
"  F9: 
"
"  F5: Help(vim help)
"  F7: FileExplorer(NerdTreeToggle)
"  F8: Outlines(TargbarToggle)
"  F9: 
" ******************************************************************
set autowrite

if !(GetOSType()=='win') 
    setlocal makeprg=gcc\ -g\ -O2\ -std=c99\ -lm\ -o\ %<\ %
endif


"  +--+  F5:   make & run
" ||F5|| C-F5: make & run debug
" |/__\| M-F5: just compile
" -----------------------------
" simple version
noremap  <F5> <Esc>:make<Bar>!./%<<CR>
noremap! <F5> <Esc>:make<Bar>!./%<<CR>

" rich version -- maybe cannot input only show result text
"noremap  <F5> <Esc>:silent make<Bar>
                "\ silent! keepalt belowright 12 split %<._rst_<Bar>
                "\ normal ggdG<Bar>
                "\ silent! 0r !./%< 2>&1<CR>
"noremap! <F5> <Esc>:silent make<Bar>
                "\ silent! keepalt belowright 12 split %<._rst_<Bar>
                "\ normal ggdG<Bar>
                "\ 0r !./%< 2>&1<CR>

noremap  <C-F5> <Esc>:make<Bar>!gdb %<<CR>
noremap! <C-F5> <Esc>:make<Bar>!gdb %<<CR>

noremap  <M-F5> <Esc><Esc>:!gcc -c -std=gnu11 % 2>%1<CR>
noremap! <M-F5> <Esc><Esc>:!gcc -c -std=gnu11 % 2>%1<CR>


"  +--+  F6:    compile 
" ||F6|| C-F6: 
" |/__\| M-F6: 



"  +--+  F7:   check codes
" ||F7|| C-F6: invoke terminal
" |/__\| M-F6: ida?
nnoremap <F7> <Esc><Esc>:w<Bar>!splint %<CR>
inoremap <F7> <Esc><Esc>:w<Bar>!splint %<CR>


"  +--+  F8:   save to repository
" ||F8|| C-F8: 
" |/__\| M-F8:
nnoremap <F8> :call GitUpdate()<CR>




let g:ycm_global_ycm_extra_conf=expand($MYVIMFTH).'ycm_extra_conf_4cpp.py'



" vim:cin:sr:et:ts=4:sts=4:tw=98:ft=vim:ff=unix:fenc=utf-8:
" EOF
