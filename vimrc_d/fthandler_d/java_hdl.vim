" FILENAME


setlocal makeprg=javac\ %

" ----------------------------------
"    +--+     F5:   clean remake & run
"   ||F5||    C-F5: just make
"   |/__\|    M-F5: just run
" ----------------------------------
" Always save current source file.

noremap  <F5>   <Esc>:w<Bar>e<Bar>call delete(expand('%<').'.class')<Bar>make && java %<<CR>
noremap! <F5>   <Esc>:w<Bar>e<Bar>call delete(expand('%<').'.class')<Bar>make && java %<<CR>
noremap  <C-F5> <Esc>:w<Bar>make && java %<<CR>
noremap! <C-F5> <Esc>:w<Bar>make && java %<<CR>
noremap  <M-F5> <Esc>:w<Bar>!java %<<CR>
noremap! <M-F5> <Esc>:w<Bar>!java %<<CR>



" vim:cin:sr:et:ts=4:sts=4:tw=98:ft=vim:ff=unix:fenc=utf-8:
" EOF
