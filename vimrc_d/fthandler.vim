

" - autocmds to automatically enter hex mode and handle file writes properly
"   refering from link http://vim.wikia.com/wiki/Improved_Hex_editing
" IMPORT:
"   + vimrc/$MYVIMRCD
"   + platform/Ops()
" EXPORT: (can be used)
"   + $MYVIMSKL
"   + $MYVIMFTH
"


let $MYVIMSKL = $MYVIMRCD.Ops().'skeleton'.Ops()
let $MYVIMFTH = $MYVIMRCD.Ops().'fthandler_d'.Ops()




" + 3.8. Pretreatment {
" ---------------------

" - Opening Vim help in a vertical split window
"   [sof](https://stackoverflow.com/questions/630884/opening-vim-help-in-a-vertical-split-window)
    "autocmd FileType help wincmd L
" }



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

augroup C
    autocmd!
    autocmd BufNewFile *.c
        \ silent! execute '0r $MYVIMSKL'.&ft.'_skl.txt' |
        \ echo '[✓]:☞ Creating '.&ft.' file. Loading corresponding template.'
    autocmd BufEnter *.c
        \ source $MYVIMFTH/c_hdl.vim
augroup END


augroup Python
    autocmd!
	autocmd BufNewFile *.py 
		\ silent! execute '0r $MYVIMSKL'.&ft.'_skl.txt' | 
        \ echo '[✓]:☞ Creating '.&ft.' file. Loading corresponding template.'
    autocmd BufEnter *.py
        \ source $MYVIMFTH/python_hdl.vim
augroup END



augroup Vim
    autocmd!
    " not like python3 'so' is not a external command so we cannot use make
	autocmd BufNewFile *.vim,*vimrc 
		\ silent! execute '0r $MYVIMSKL/'.&ft.'_skl.txt' | 
        \ echo '[✓]:☞ Creating '.&ft.' file. Loading corresponding template.'
    autocmd BufEnter *.vim,*vimrc
         \ source $MYVIMFTH/vim_hdl.vim
augroup END


autocmd FileType apache setlocal commentstring=#\ %s

" FileType Html Pretreatment
" --------------------------
augroup Html
	autocmd!
	autocmd BufNewFile *.html,*.htm 
		\ echo '[+] Filetype "html" detected, try to cast the corresponding skeleton.' |
		\ 0r $MYVIMSKL/html_skl.txt  |
		\ normal 2j
augroup END


" FileType Sh Pretreatment
" --------------------------
augroup Sh
    autocmd!
    autocmd BufEnter *.sh,*.zsh
        \ echo '[+] Filetype "sh" detected, recommend using zsh or bash.' |
        \ 0r $MYVIMSKL/sh_skl.txt |
        \ normal 2j
augroup END





" vim:cin:et:ts=4:sts=4:tw=98:ft=vim:ff=unix:fenc=utf-8:
" EOF
