" FILENAME

noremap  <F5> <Esc>:w <Bar> !dot -Tpng % -o %<.png <CR>
noremap! <F5> <Esc>:w <Bar> !dot -Tpng % -o %<.png <CR> 

noremap  <C-F5> <Esc>:w<Bar>!dot -Tpng % -o %<.png && feh %<.png<CR> 
noremap! <C-F5> <Esc>:w<Bar>!dot -Tpng % -o %<.png && feh %<.png<CR> 

" vim:noeol:cin:sr:et:ts=4:sts=4:tw=98:ft=vim:ff=unix:fenc=utf-8:
" EOF
