" ===========================================================================-
" Copyright (C) 2014 nick All Rights Reserved
" Maintainer:   nick
" Created:      2014-10-04
" LastModify:   2015-01-08
" Version:      v1.0
" 
" Sections:
"   - Global Variables.
"   - Vundle The Vim Plugin System.
"   - User Interface.
"       -- 
"   - Text Editing And Display.
"       -- Indent Related
"       -- Search Related
"       -- Fold Related
"       -- File Type Specific
"   - Plugin Settings.
"       -- NERDTree
"       -- Yggdroot/indentLine
"   - Key Mapping
"   - Local Settings.
"
" TODO_List:    
"     - Windows CMD Supports
"
" Reference:
"    - http://www.oschina.net/code/snippet_574132_13357
" =============================================================================


" < 0x01 >. Set Global Variables.
" ===============================

"   +-----------+-----------+---------+
"   |           | isWindows | isLinux |
"   +-----------+-----------+---------+
"   | isGUI     |           |         |
"   +-----------+-----------+---------+
"   | isConsole |           |         |
"   +-----------+-----------+---------+

    set nocompatible
    let g:isWindows = 0
    let g:isLinux   = 0
    let g:isGUI     = 0
    let g:isConsole = 0

    if(has("win32") || has("win64") || has("win95") || has("win16"))
        let g:isWindows = 1
    else
        let g:isLinux   = 1
    endif
    
    if has("gui_running")
        let g:isGUI     = 1
    else
        let g:isConsole = 1
    endif
" }


" < 0x02 >. VUNDLE THE VIM PLUGIN SYSTEM. 
" ==============================================================
" BRIEF:  see :h vundle for more details
" :PluginList      - list configured plugins
" :PluginInstall   - installs plugins; append '!' to update
" :PluginUpdate    - equal :PluginInstall!
" :PluginClean     - confirms removal of unused plugins; append '!' to 
"                    auto-appove
" Plugin 'XXXX' equals Plugin 'https://github.com/vim-scrips/XXXX.git'
"
    filetype off
    if g:isLinux
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
    else
        set rtp+=~/vimfiles/bundle/Vundle.vim/
        let path='~/vimfiles/bundle'
        call vundle#begin(path)
    endif

    Plugin 'gmarik/Vundle.vim'

    " airline plugins and support plugins
    Plugin 'bling/vim-airline' " powerline is deprecated 
    Plugin 'kien/ctrlp.vim'
    Plugin 'Shougo/unite.vim'
    Plugin 'majutsushi/tagbar'
    Plugin 'chrisbra/csv.vim'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'jmcantrell/vim-virtualenv'
    Plugin 'mbbill/fencview'

    Plugin 'mhinz/vim-startify'
    Plugin 'mhinz/vim-tmuxify'
    Plugin 'mhinz/vim-signify'

    Plugin 'mattn/vimtweak'
"    Plugin 'mattn/transparency-windows-vim'
    Plugin 'mattn/emmet-vim'
    
    Plugin 'edkolev/tmuxline.vim'
    Plugin 'edkolev/promptline.vim'

    Plugin 'scrooloose/nerdtree'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'scrooloose/syntastic'
   
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-commentary'

    Plugin 'xolox/vim-shell'
    Plugin 'xolox/vim-misc'

"   markdown plugins
"   Plugin 'godlygeek/tabular'
"   Plugin 'plasticboy/vim-markdown'
    Plugin 'vim-pandoc/vim-pandoc'
    Plugin 'vim-pandoc/vim-pandoc-syntax'
    Plugin 'vim-pandoc/vim-pandoc-after'

    Plugin 'Yggdroot/indentLine'
    Plugin 'a.vim'
    Plugin 'Align'
    Plugin 'bufexplorer.zip'
    Plugin 'ccvext.vim'
    Plugin 'cSyntaxAfter'
    Plugin 'chase/vim-ansible-yaml'
    
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'std_c.zip'
    Plugin 'Shougo/neocomplcache.vim'
    Plugin 'taglist.vim'
    Plugin 'TxtBrowser'
    Plugin 'Mark--Karkat'
    Plugin 'msanders/snipmate.vim'
    Plugin 'OmniCppComplete'
    Plugin 'repeat.vim'
    Plugin 'vim-javacompleteex'
    Plugin 'wesleyche/SrcExpl'
    Plugin 'ZoomWin'
    Plugin 'jeroenbourgois/vim-actionscript'
    " full screen the window
"    Plugin 'derekmcloughlin/gvimfullscreen_win32'
    " Plugin 'jistr/vim-nerdtree-tabs'
    " Plugin 'EditPlus.git'   " a color scheme
    if g:isLinux
        call vundle#end()
    else
        call vundle#end(path)
    endif
" }


"  < 0x03 >. General settins for code writing and file editing. 
" ==============================================================================
" set nocompatible          showmode showcmd
" set shortmess=atI

" Edit Interface {{
" -----------------
    set number
    set ruler
    "set laststatus=2
    set cmdheight=1
    set cursorline
    hi CursorLine term=underline cterm=underline guibg=#3A3A3A
    hi CursorLine ctermbg=darkgrey guibg=gray13
    if g:isGUI
        " au GUIEnter * simalt ~x
        winpos 100 20
        set columns=200
        set lines=60
        " set guioptions-=T
    endif
   
    set background=dark
   
    if g:isWindows
        if g:isGUI
            colorscheme rainbow_neon
        else
            colorscheme desert
        endif
        set guifont=Terminus:h12
        "set guifont=gohufont-14:h12
        set guifontwide=Yahei\ Mono:h10.5
    else
        if g:isGUI
            set t_Co=256
        endif
        colorscheme rainbow_neon
        set guifont=Terminus\ 10
    endif
    
    set lazyredraw       " Fix the problems for scrolling slowly
    " REF: http://vim.wikia.com/wiki/The_perfect_programming_font
    " set guifont=ProggyCleanTT\ 12
    " set guifont=ProggyClean
    " set guifont=YaHei\ Consolas\ Hybrid, h12
    " set guifont=Source\ Code\ Pro\ 11:h11
" }}

" tabs and indent 
" {
    set shiftwidth=4
    set tabstop=4
    set expandtab
    set cindent
    set smartindent
    set autoindent
    " Except for Makefiles; hard tabs of width 2
    au FileType make set ts=2
    " And Markdown
" }


" search options 
" -----------------------------------------------------------------------------
    set showmatch
    set incsearch
    set ignorecase
    set smartcase
    set hlsearch
" ----

" file options 
" {
    syntax on
    filetype on
    filetype plugin on
    filetype plugin indent on
    if has("multi_byte")
        set encoding=utf-8
    endif
    "set fileencoding=utf-8
    "set termencoding=utf-8
    let &termencoding=&encoding
    set fileencodings=utf-8,cp936,default,latin-1,GB232,GBK,GB8030,ucs-bom
    "if g:isWindows
        set fileformat=dos
        set fileformats=dos
    "else
    "    set fileformat=unix
    "    set fileformats=unix,dos
    "endif
    set formatoptions=croql
    set backspace=indent,eol,start
" } 

" code fold 
" -----------------------------------------------------------------------------
    set foldenable
    set foldmethod=indent    "/marker/syntax"
    set foldcolumn=1
    set foldlevelstart=20
    let javaScript_fold=1                 " JavaScript
    let perl_fold=1                       " Perl
    let php_folding=1                     " PHP
    let r_syntax_folding=1                " R
    let ruby_fold=1                       " Ruby
    let sh_fold_enabled=1                 " sh
    let vimsyn_folding='af'               " Vim script
    let xml_syntax_folding=1              " XML
    " use SPACE to unfold code, zR: open all folds zM: close all folds
    nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" ----


" Set Nowrap 
" -----------------------------------------------------------------------------
    set writebackup
    set nobackup
    set noswapfile          " use version control insead
    set clipboard=unnamed   " use OS clipboard ro copypasta
    set paste               " fix bad autoindent of pasted text
    if has("mouse")         " Enable OS mouse clicking and scrolling
        set mouse=a
    endif
    set autoread
    set autochdir
" ----

"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)



" autocmds to automatically enter hex mode and handle file writes properly
if has("autocmd")
  " vim -b : edit binary using xxd-format!
  augroup Binary
    au!

    " set binary option for all binary files before reading them
    au BufReadPre *.bin,*.hex,*.exe,*.dll setlocal binary

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
endif
" refering from link http://vim.wikia.com/wiki/Improved_Hex_editing


"  < 0x04 >. SETTINGS FOR PLUGINS.
" =============================================================================

" plugins.bling/vim-airline
" {
    let g:Powerline_symbols = 'fancy'
    set t_Co=256
    set fillchars+=stl:\ ,stlnc:\
    set laststatus=2
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme             = 'powerlineish'

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    
" }

" plugins.yggdroot/indentline 
" {
    nmap <leader>il :IndentLinesToggle<CR>
    let g:indentLine_enabled=1
    "let g:indentLine_char = '┊'
    if g:isGUI
        let g:indentLine_char = "¦"
        let g:indentLine_first_char = "¦"
        "let g:indentLine_color_gui = '#A4E57E'
        let g:indentLine_color_gui = '#C0C0C0'
    else
        let g:indentLine_color_term =239
    endif
" }

" plugins.scrooloose/nerdtree 
" {
    autocmd bufenter * if (winnr("$") == 1 && 
                \ exists("b:NERDTreeType") && 
                \ b:NERDTreeType == "primary") | q | 
                \ endif
    if g:isWindows
        let g:NERDTreeCopyCmd= 'copy '
    else
        let g:NERDTreeCopyCmd= 'cp -r'
    endif
    nmap <F2> :NERDTreeToggle ..<CR>
" }


" plugins.derekmcloughlin/gvimfullscreen_win32 
" {
    map <F11> <Esc>:call libcallnr('gvimfullscreen.dll',
                \ 'ToggleFullScreen', 0)<CR><C-L>
" }

" plugins.mattn/vimtweak
" {
    if g:isWindows && g:isGUI
        function! s:Transparency(v)
            call libcallnr('vimtweak.dll', 'SetAlpha', 255-a:v) 
        endfunction
        augroup transparency_windows
          autocmd!
          autocmd FocusGained * call s:Transparency(12)
          autocmd FocusLost * call s:Transparency(60)
        augroup END
    endif
    map <F10> <Esc>:call libcallnr('vimtweak.dll', 
                \ 'SetAlpha', 232)<CR>
    map <S-F10> <Esc>:call libcallnr('vimtweak.dll',
                \ 'SetAlpha', 255)<CR>
" }


" plugins.for.markdown
"    - plasticboy/vim-markdown 
"    - 
" {
  "  au BufNewFile,BufFilePre,BufRead *.md setf markdown
    au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
    let g:vim_markdown_folding_disabled=1 " Markdown
    let g:vim_markdown_math=1
    let g:vim_markdown_frontmatter=1
    let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
    let g:pandoc#filetypes#pandoc_markdown = 0
    let g:pandoc#modules#disabled = ["folding"]
    let g:pandoc#spell#enabled = 0
    nnoremap <leader>pd :!pandoc % -f markdown -t html -s -o %.html && %.html<CR>
    let g:vim_pandoc_syntax_exists = 1
    " vim-pandoc-after
    let g:pandoc#after#modules#enabled = ["nrrwrgn", "ultisnips"]
" }

" Plugins.scrooloose/syntastic 
" {
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    let g:syntastic_python_python_exec = 'C:/Python27/'
" }

" plugins.kien/ctrlp 
" {
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    if exists("g:ctrl_user_command")
        unlet g:ctrlp_user_command
    endif
    set wildignore+=.* 
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
    
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"    let g:ctrlp_custom_ignore = {
"        \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"        \ 'file': '\v\.(exe|so|dll)$',
"        \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
"        \ } 
"   let g:ctrlp_custom_ignore = { 'dir':  '\v[\/]\.(git|hg|svn)$', 
"       \ 'file': '\v\.(exe|so|dll)$', 'link': 'some_bad_symbolic_links'}
"   let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"   let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
" }

" plugins.mhinz/vim-startify
" {
    let g:startify_custom_header = [
            \ '  +--------------------------------------------------------------------------+   ',
            \ ' /               --=  NICK''s PERSIONAL DEVELOPMENT STUDIO  =--                \  ',
            \ ' |                          fatework@arch.team                                | ',
            \ ' |                                         ________  __ __                    | ',
            \ ' |                   __                   /\_____  \/\ \\ \                   |',
            \ ' |           __  __ /\_\    ___ ___       \/___//''/''\ \ \\ \                  | ',
            \ ' |          /\ \/\ \\/\ \ /'' __` __`\         /'' /''  \ \ \\ \_                | ',
            \ ' |          \ \ \_/ |\ \ \/\ \/\ \/\ \       /'' /''__  \ \__ ,__\              | ',
            \ ' |           \ \___/  \ \_\ \_\ \_\ \_\     /\_/ /\_\  \/_/\_\_/              | ',
            \ ' |            \/__/    \/_/\/_/\/_/\/_/     \//  \/_/     \/_/                | ',
            \ ' +----------------------------------------------------------------------------+ ',
            \ ' |                                                                            |',
            \ '',
            \ ]
    let g:startify_custom_footer = [
            \ ' |                                                                            | ',
            \ ' |                          fatework@arch.team                                | ',
            \ ' \               --=  NICK''s PERSIONAL DEVELOPMENT STUDIO  =--                / ',
            \ '  +--------------------------------------------------------------------------+ ',
            \ '',
            \ ]
    map <leader>st <Esc>:Startify<CR>
" }


"  < 0x05 >. Map common keyboard shortcuts. 
" =============================================================================

imap <C-a> <Esc>I
imap <C-e> <ESC>A
"map <C-Tab> <C-W>w
"imap <C-Tab> <C-O><C-W>w
"imap <C-Tab> <C-C><C-Tab>
map <kMinus> :cp<C-M>
map - :cp<C-M>
map <kPlus> :cn<C-M>
map + :cn<C-M>
vmap <C-c> "+y
vmap <S-Insert> "+gP
nmap <C-c> "+yy
vmap <C-x> "+d
map <C-s> :w
if g:isWindows
    nmap <leader>e :tabnew $HOME/_vimrc<CR>
else
    nmap <leader>e :tabnew $HOME/.vimrc<CR>
endif
nmap <leader>t :tabnew<CR>
nmap <leader>nl <ESC>:nohl<CR>
nmap <C-Tab> <Esc>gt
nmap <C-S-Tab> <Esc>gT
imap <C-Tab> <Esc>gt
imap <C-S-Tab> <Esc>gT
nnoremap K i<CR><Esc>
map  <leader>w <Esc><C-W><C-W>
map <F9> <Esc>:w<CR>:!start cmd /c %<CR>
map <leader>up <Esc>:PluginUpdate<CR>
"nnoremap <leader>gq :%!pandoc -f html -t markdown <bar> pandoc -f markdown -t html<CR>
"vnoremap <leader>gq :!pandoc -f html -t markdown <bar> pandoc -f markdown -t html<CR>

