

" document:
" --------
"



setlocal makeprg=python3\ % 
nnoremap <F5> :w<Bar>make<CR>
inoremap <F5> <Esc>:w<Bar>make<CR>

nnoremap <C-F5> :w<bar>exec '!python3 -m pdb '.shellescape('%')<CR>
inoremap <C-F5> <Esc>:w<Bar>exec '!python3 -m pdb'.shellescape('%')<CR>

nnoremap <F6> :!python3<CR>
inoremap <F6> <Esc>:!python3<CR>

nnoremap <F7> :!pylint %<CR>
inoremap <F7> :!pylint %<CR>

nnoremap <F8> :call GitUpdate()<CR>



" vim:cin:sr:et:ts=4:sts=4:tw=98:ft=vim:ff=unix:fenc=utf-8:
" EOF
