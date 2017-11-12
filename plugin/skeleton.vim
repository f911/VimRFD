

" - autocmds to automatically enter hex mode and handle file writes properly
"   refering from link http://vim.wikia.com/wiki/Improved_Hex_editing
augroup Binary
  au!

  " set binary option for all binary files before reading them
  au BufReadPre *.bin,*.hex,*.exe,*.dll,*.png setlocal binary

  " if on a fresh read the buffer variable is already set, it's wrong
  au BufReadPost *
        \ if exists('b:editHex') && b:editHex |
        \   let b:editHex = 0 |
        \ endif

  " convert to hex on startup for binary files automatically
  au BufReadPost *
        \ if &binary | Hexmode | endif

  " When the text is freed, the next time the buffer is made active it will
  " re-read the text and thus not match the correct mode, we will need to
  " convert it again if the buffer is again loaded.
  au BufUnload *
        \ if getbufvar(expand("<afile>"), 'editHex') == 1 |
        \   call setbufvar(expand("<afile>"), 'editHex', 0) |
        \ endif

  " before writing a file when editing in hex mode, convert back to non-hex
  au BufWritePre *
        \ if exists("b:editHex") && b:editHex && &binary |
        \  let oldro=&ro | let &ro=0 |
  " vim -b : edit binary using xxd-format!
        \  let oldma=&ma | let &ma=1 |
        \  silent exe "%!xxd -r" |
        \  let &ma=oldma | let &ro=oldro |
        \  unlet oldma | unlet oldro |
        \ endif

  " after writing a binary file, if we're in hex mode, restore hex mode
  au BufWritePost *
        \ if exists("b:editHex") && b:editHex && &binary |
        \  let oldro=&ro | let &ro=0 |
        \  let oldma=&ma | let &ma=1 |
        \  silent exe "%!xxd" |
        \  exe "set nomod" |
        \  let &ma=oldma | let &ro=oldro |
        \  unlet oldma | unlet oldro |
        \ endif
augroup END

" FileType Python Pretreatment
" ----------------------------
augroup Python
	au BufNewFile *.py 
		\ echo '[+] Filetype "python" detected, and set the corresponding template.' |
		\ 0r $HOME/.vim/skeleton/python_skl.txt  |
		\ normal 4jW
augroup END




" FileType Html Pretreatment
" --------------------------
augroup Html
	au!
	au BufNewFile *.html,*.htm 
		\ echo '[+] Filetype "html" detected, try to cast the corresponding skeleton.' |
		\ 0r $HOME/.vim/skeleton/html_skl.txt  |
		\ normal 2j
augroup END


" vim:nocp:ai:si:et:ts=4:sts=4:ft=vim:ff=unix:fenc=utf-8:
" EOF
