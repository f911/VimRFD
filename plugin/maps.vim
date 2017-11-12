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
imap <C-a> <Esc>I
imap <C-e> <ESC>A
"map <C-Tab> <C-W>w
"imap <C-Tab> <C-O><C-W>w
"imap <C-Tab> <C-C><C-Tab>
map <kMinus> :cp<C-M>
map - :cp<C-M>
map <kPlus> :cn<C-M>
map + :cn<C-M>

vnoremap <C-Insert> "+y
inoremap <S-Insert> <Esc>"+gP

nmap <C-c> "+yy
vmap <C-x> "+d
map <C-s> :w

" rc file and plug operations
if g:isWindows
	nmap <leader>rc :tabnew $HOME/vimfiles/vimrc<CR>
elseif g:isMsys
	nmap <leader>rc :tabnew $HOME/vimfiles/vimrc<CR>
else " linux & Mac
	nmap <leader>rc :vsplit ~/.vim/vimrc<CR>
	nmap <leader>pu <Esc>:PlugUpdate<CR>
	nmap <leader>ps <Esc>:PlugStatus<CR>
endif

nmap <leader>t :tabnew<CR>
nmap <leader>nl <ESC>:nohl<CR>

nmap <C-Tab> <Esc>gt
nmap <C-S-Tab> <Esc>gT
imap <C-Tab> <Esc>gt
imap <C-S-Tab> <Esc>gT



" Alt + l move right across quote.
" 
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-d> <DELETE>



" cutting to a new line and continue insert/edit
nnoremap K i<CR>

map  <leader>w <Esc><C-W><C-W>
map <F9> <Esc>:w<CR>:!node %<CR>

"map <leader> <Esc>:w<CR><Esc>:so $HOME/_vimrc<CR><Esc>:PluginUpdate<CR>
"nnoremap <leader>gq :%!pandoc -f html -t markdown <bar> pandoc -f markdown -t html<CR>
"vnoremap <leader>gq :!pandoc -f html -t markdown <bar> pandoc -f markdown -t html<CR>
" }
