" $MYVIMFTH/vim_hdl.vim
"
" document
" --------
"

nnoremap <F5> :w<Bar>so %<Bar>echom '[✓]☞ Sourced Ok!⧓ '<CR>
inoremap <F5> <Esc>:w<Bar>so %<Bar>echom '[✓]☞ Sourced OK!⧓ '<CR>
nnoremap <F8> :call GitUpdate()<CR>

" vim:cin:sr:et:ts=4:sts=4:tw=98:ft=vim:ff=unix:fenc=utf-8:
" EOF
