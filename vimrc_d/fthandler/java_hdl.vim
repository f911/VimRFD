" FILENAME




set autowrite


setlocal makeprg=javac\ %

" ----------------------------------
"    +--+     F5:   Compile Source Only
"   ||F5||    C-F5: Compile And Run
"   |/__\|    S-F5: Compile Source And Invoke a Terminal
" ------------------------------------------------------
" Always save current source file.

noremap  <F5>   <Esc>:w<Bar>e<Bar>make<CR>
noremap! <F5>   <Esc>:w<Bar>e<Bar>make<CR>

noremap  <C-F5> <Esc>:w<Bar>e<Bar>make && java %<<CR>
noremap! <C-F5> <Esc>:w<Bar>e<Bar>make && java %<<CR>

noremap  <S-F5> <Esc>:w<Bar>e<Bar>make<Bar>!gnome-terminal --geometry=160x48+600+300<CR>
noremap! <S-F5> <Esc>:w<Bar>e<Bar>make<Bar>!gnome-terminal --geometry=160x48+600+300<CR>

"noremap  <F5>   <Esc>:w<Bar>e<Bar>call delete(expand('%<').'.class')<Bar>make && java %<<CR>
"noremap! <F5>   <Esc>:w<Bar>e<Bar>call delete(expand('%<').'.class')<Bar>make && java %<<CR>

" vim:cin:sr:et:ts=4:sts=4:tw=98:ft=vim:ff=unix:fenc=utf-8:
" EOF
