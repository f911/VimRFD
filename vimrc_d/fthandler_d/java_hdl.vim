" FILENAME


setlocal makeprg=javac\ %

"  +--+  F5:   make & run
" ||F5|| C-F5: make & run debug
" |/__\| M-F5: just compile
" -----------------------------

" simple version
noremap  <F5> <Esc>:make<Bar>!./%<<CR>
noremap! <F5> <Esc>:make<Bar>!./%<<CR>



" vim:noeol:cin:sr:et:ts=4:sts=4:tw=98:ft=vim:ff=unix:fenc=utf-8:
" EOF
