

" - autocmds to automatically enter hex mode and handle file writes properly
"   refering from link http://vim.wikia.com/wiki/Improved_Hex_editing
" - use execute to construct commandlines.
" IMPORT:
"   + vimrc/$MYVIMRCD
"   + platform/Ops()
" EXPORT: (can be used)
"   + $MYVIMSKL
"   + $MYVIMFTH
"


let $MYVIMSKL = $MYVIMRCD.Ops().'skeleton'.Ops()
let $MYVIMFTH = $MYVIMRCD.Ops().'fthandler'.Ops()





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

augroup GenFTResponse
    autocmd!
    autocmd BufNewFile *.md call s:LoadFTSkeleton('markdown')
    autocmd BufEnter *.md call s:LoadFTHandler('markdown')
    autocmd BufNewFile *.* call s:LoadFTSkeleton(&ft)
    autocmd BufEnter *.* call s:LoadFTHandler(&ft)
augroup END


silent! function s:LoadFTSkeleton(ft)
    
    let s:ft_skl=expand($MYVIMSKL).a:ft.'_skl.txt'
    if filereadable(s:ft_skl)
        set noendofline
        silent! execute '0r '.s:ft_skl
        " Delete last blank line(LF) after read-in skeleton
        normal GGddgg2j
        silent! echo '[✓]:⧓ :Creating '.a:ft.' file. Loading corresponding template.'
    else
    "    echom '[Δ]:☞ :You can create your own skeleton file in place: '.s:ft_skl
    "   open a blank buffer
    "   maybe create your own skeleton file is a better idea than nothing to do.
    endif
endfunction

silent! function s:LoadFTHandler(ft)
    let s:ft_hdl=expand($MYVIMFTH).a:ft.'_hdl.vim'
    if filereadable(s:ft_hdl)
        silent! execute 'source '.s:ft_hdl
        silent! echo '[✓]:⧓ :Switch to filetype: '.a:ft.' settings.'
    else
    "    echom '[Δ]:☞ :You can create your own handler file in place: '.s:ft_hdl
    endif
endfunction





autocmd FileType apache setlocal commentstring=#\ %s



" Reference:
" + Opening Vim help in a vertical split window
"   [sof](https://stackoverflow.com/questions/630884/opening-vim-help-in-a-vertical-split-window)
"       autocmd FileType help wincmd L

" vim:cin:et:ts=4:sts=4:tw=98:ft=vim:ff=unix:fenc=utf-8:
" EOF
