" $MYVIMFTH/vim_hdl.vim 


if !(GetOSType()=='win') 
    setlocal makeprg=gcc\ -g\ -O2\ -std=gnu11\ -static\ -lm\ -o\ %<\ %
    nnoremap <F5> :w<Bar>make<CR>
    inoremap <F5> <Esc>:w<Bar>make<CR>
    nnoremap <F6> :!./%<<CR>
    inoremap <F6> <Esc>:w<Bar>!./%<<CR>
    nnoremap <C-F6> :w<Bar>make<Bar>!./%<<CR>
    inoremap <C-F6> <Esc>:w<Bar>make<Bar>!./%<<CR>
endif
nnoremap <F7> :!splint %<CR>
inoremap <F7> <Esc>:!splint %<CR>

nnoremap <F8> :call GitUpdate()<CR>


let g:ycm_global_ycm_extra_conf=expand($MYVIMFTH).'ycm_extra_conf_4cpp.py'



" vim:cin:sr:et:ts=4:sts=4:tw=98:ft=vim:ff=unix:fenc=utf-8:
" EOF

