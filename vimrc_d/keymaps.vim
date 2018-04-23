" * **0x05. Key Mappings.**
" =========================
"
" map commands, in some aspect, is so complicated, as it need adapt so many occasions.
"
" + Most meterial says vim has *FOUR* modes, they are:
"
"     1. Normal-mode  
"     2. Insert-mode / Replace-mode
"     3. Visual-mode / Select-mode  
"     4. Command-mode
"
" + In vim official help documents, there are *SIX* sets of mappings:
"
"     1. For Normal mode: When typing commands.
"     2. For Visual mode: When typing commands while the Visual area is highlighted.
"     3. For Select mode: like Visual mode but typing text replaces the selection.
"     4. For *Operator-pending mode*: When an operator is pending, for example, after \
"        'd':delete, 'y':yank, 'c':cut, etc. afterwards arguments or commands waiting \
"        to input.
"     5. For Insert mode.  These are also used in *Replace mode*.
"     6. For Command-line mode: When entering a ':' or '/' command.
"
" +  `map` command there are *THREE* type of usage in general:
"
"     1. Recurive-mapping or remap
"     2. Non-recurive-mapping or noremap
"     3. Cancel-mapping or unmap
"     remap type is an option that makes mappings work recursively, which is usually
"     on by default. for example: :map j gg + :map Q j = :map Q gg
" 
" Above all, you can get 6x3=18 kinds of mapping using cases, at least. WTF.
" The common 'map' commands' action scope can be generally illustrated as table
" bellow:
"
" +-------------------+--------+--------+------------------+-------------+--------------+
" |   map commands    | Normal | Visual | Operator Pending | Insert Only | Command Line |
" +-------+-+---------+--------+--------+------------------+-------------+--------------+
" | :map  | :noremap  |   y    |   y    |        y         |             |              |
" | :nmap | :nnoremap |   y    |        |                  |             |              |
" | :vmap | :vnoremap |        |   y    |                  |             |              |
" | :omap | :onoremap |        |        |        y         |             |              |
" | :map! | :noremap! |        |        |                  |      y      |      y       |
" | :imap | :inoremap |        |        |                  |      y      |              |
" | :cmap | :cnoremap |        |        |                  |             |      y       |
" +-------+-----------+--------+--------+------------------+-------------+--------------+
"     _tab5-1:'map' commands' action scope_
" 
" What's more if you type help :map! you can get more map commands and more cases... Orz
"
" + map-mode and map-commands in official documents:
" 
"     1. mapmode-nvo   map    noremap    unmap    mapclear
"     2. mapmode-n     nmap   nnoremap   nunmap   nmapclear
"     3. mapmode-v     vmap   vnoremap   vunmap   vmapclear
"     4. mapmode-x     xmap   xnoremap   xunmap   xmapclear
"     5. mapmode-s     smap   snoremap   sunmap   smapclear
"     6. mapmode-o     omap   onoremap   ounmap   omapclear
"     7. mapmode-ic    map!   noremap!   unmap!   mapclear!
"     8. mapmode-i     imap   inoremap   iunmap   imapclear
"     9. mapmode-l     lmap   lnoremap   lunmap   lmapclear
"    10. mapmode-c     cmap   cnoremap   cunmap   cmapclear
"
"    more details read Key mapping in vim's help
"    
"
" Reference:
" [zhihu-vimstudy-map](https://zhuanlan.zhihu.com/p/24713018)
" [csdnblog-vimmap-forward](http://blog.csdn.net/lym152898/article/details/52171494)
" [pythonclub](http://www.pythonclub.org/linux/vim/map)
" [it-house](http://www.it1352.com/535382.html)
" help :map!
" "
"imap <C-a> <Esc>I
"imap <C-e> <ESC>A
""map <C-Tab> <C-W>w
""imap <C-Tab> <C-O><C-W>w
""imap <C-Tab> <C-C><C-Tab>
"map <kMinus> :cp<C-M>
"map - :cp<C-M>
"map <kPlus> :cn<C-M>
"map + :cn<C-M>

"vnoremap <C-Insert> "+y
"inoremap <S-Insert> <Esc>"+gP

"nmap <C-c> "+yy
"vmap <C-x> "+d
"map <C-s> :w

"" rc file and plug operations

"nmap <leader>t :tabnew<CR>
"nmap <leader>nl <ESC>:nohl<CR>

"nmap <C-Tab> <Esc>gt
"nmap <C-S-Tab> <Esc>gT
"imap <C-Tab> <Esc>gt
"imap <C-S-Tab> <Esc>gT

nnoremap <leader>rc :tabnew $MYVIMRC<CR>

" Alt + l move right across quote.
" 
"
" Improved_Movements:
" ------------------
"  <jj> -- <Esc> in Inser-Mode only
"  <kk> -- Save in Inser-Mode only
"
nnoremap <M-h> <Left>
nnoremap <M-j> <Down>
nnoremap <M-k> <Up>
nnoremap <M-l> <Right>
nnoremap <M-o> o

inoremap <M-h> <Esc>i
inoremap <M-j> <Esc><Down>a
inoremap <M-k> <Esc><Up>a
inoremap <M-l> <Esc><Right>a
inoremap <M-o> <Esc>o
inoremap <M-x> <Del>

imap jj <Esc>
imap kk <Esc>:w<CR>
"imap :: <Esc>:

" Text_Edit:
" ---------
" cutting to a new line and continue insert/edit
nnoremap K i<CR>

" Copy_and_Paste:
" --------------
"   Universally use: 
"   <C-Insert> -- Copy. 
"   <S-Insert> -- Paste.
"   ref: [1]
vnoremap <C-Insert> "+y
nnoremap <S-Insert> "+p
inoremap <S-Insert> <Esc>"+p
cnoremap <S-Insert> <C-f>"+p

" Search_and_Replace:
" ------------------
nnoremap <LocalLeader>hl <Esc>:nohl<CR>

" Save_and_Exit:
" -------------
"  if use conbined key-shortcuts, choose win/emacs-like style.
"  <M-s> -- Save.
"  <M-q> -- Save & Exit.
"  or use <C-w-q> to quit by plugin config
noremap  <M-s> <Esc><Esc>:w<CR>
noremap! <M-s> <Esc><Esc>:w<CR>

nnoremap <M-q> <Esc><Esc>:q!<CR>
inoremap <M-q> <Esc><Esc>:q!<CR>
nnoremap <M-Q> <Esc><Esc>:wq<CR>
inoremap <M-Q> <Esc><Esc>:wq<CR>


" Buffer_Tab_Window:
" -----------------
nnoremap <C-Tab> gt
nnoremap <S-C-Tab> gT
nnoremap <M-b> :ls<CR>
inoremap <M-b> <Esc>:w<Bar>ls<CR>

" App_Size_Position:
" -----------------
noremap  <F12>   <Esc>:se co=100 lines=40<Bar>echom '[✓]☞ Resized MIN OK!'<CR>
noremap! <F12>   <Esc>:se co=100 lines=40<Bar>echom '[✓]☞ Resized MIN OK!'<CR>
noremap  <S-F12> <Esc>:se co=200 lines=69<Bar>echom '[✓]☞ Resized Max OK!'<CR>
noremap! <S-F12> <Esc>:se co=200 lines=52<Bar>echom '[✓]☞ Resized Max OK!'<CR>



" [1](http://vim.wikia.com/wiki/Copy,_cut_and_paste)

"map  <leader>w <Esc><C-W><C-W>
"map <F9> <Esc>:w<CR>:!node %<CR>

"map <leader> <Esc>:w<CR><Esc>:so $HOME/_vimrc<CR><Esc>:PluginUpdate<CR>
"nnoremap <leader>gq :%!pandoc -f html -t markdown <bar> pandoc -f markdown -t html<CR>
"vnoremap <leader>gq :!pandoc -f html -t markdown <bar> pandoc -f markdown -t html<CR>
" }
