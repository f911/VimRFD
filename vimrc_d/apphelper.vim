" $MYVIMRCD/apphelper.vim


" document
" 


silent function! GitUpdate()
    exec '!git add %'
    exec '!git commit -va -m "[✓]⛖  Autocommit from vim.⧓ "'
    exec '!git pull'
    exec '!git push'
endfunction

" vim:cin:sr:et:ts=4:sts=4:tw=98:ft=vim:ff=unix:fenc=utf-8:
" EOF
