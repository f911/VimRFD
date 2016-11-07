" ============================================================================
" Copyright (C) 2014 nick All Rights Reserved
"
" VIM RESOURCE FILE :  .vim/vimrc or vimfiles/vimrc
" Creator           :  nick
" Created           :  2014-10-04
" LastModify        :  2016-11-08
" Version           :  v1.4
" =============================================================================

"           Platforms:
" - Windows / MSYS
" - Linux: test on CentOS / Unbuntu
" - Mac OS X

"           Sections:
" - 0x01. Global Variable Definitions.
" - 0x02. Vundle Plugins' List.
" - 0x03. General Display And Actions.
" - 0x04. Vundle Plugins' Configuration. 
" - 0x05. Key Mappings.

"           Features:
" - c/c++/bash
" - vbscript 
" - actionscript
" - markdown
" - nodejs
" - YouCompleteMe (BugsFixed:python_interpreter_path:2016-11-07)
" - NerdFonts

"           Changes:
" - Adding YouCompleteMe Supports on Windows
" - Can self compile the gvim-x64 using vs2015
" - Add $HOME=X:\home to user environment variable, and $HOME\vimfiles\bin to PATH
" - Accordingly change the user $PATH to right vimfiles\bin

"           TODO_List:
" - js's plugins configuration.

"           Reference:
" - http://www.oschina.net/code/snippet_574132_13357


" { - 0x01. Global Variable Definitions.
" ====================================
"
" +-----------+-----------+--------+-------+---------+
" |           | isWindows | isMsys | isMac | isLinux |
" +-----------+-----------+--------+-------+---------+
" | isGUI     |           |        |       |         |
" +-----------+-----------+--------+-------+---------+
" | isConsole |           |        |       |         |
" +-----------+-----------+--------+-------+---------+

    set nocompatible
    let g:isWindows = 0
    let g:isMsys    = 0
    let g:isMac     = 0
    let g:isLinux   = 0
    let g:isGUI     = 0  " else isConsole
    
"   use `:help feature-list` to see all feature list, and `:version` to show which has
"   clear about `options` and `features` 
    if(has("win16") || has("win32") || has("win64") || has("win95"))
        let g:isWindows = 1
    elseif (has("win32unix") && $OS=="Windows_NT")
        let g:isMsys    = 1
    elseif (has("macunix"))
        let g:isMac     = 1
    elseif (has("unix"))
        let g:isLinux   = 1
    endif
    
    if has("gui_running")
        let g:isGUI     = 1
    else
        let g:isConsole = 1
    endif
" }

" { - 0x02. Vundle The Vim Plugin System. 
" =======================================
" 
" BRIEF:  see :h vundle for more details
" :PluginList      - list configured plugins
" :PluginInstall   - installs plugins; append '!' to update
" :PluginUpdate    - equal :PluginInstall!
" :PluginClean     - confirms removal of unused plugins; append '!' to 
"                    auto-appove
" Plugin 'XXXX' equals Plugin 'https://github.com/vim-scrips/XXXX.git'
"
    filetype off
    if g:isWindows 
        set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
        call vundle#begin('$HOME/vimfiles/bundle/')
    elseif g:isMsys
        set rtp+=$HOME/vimfiles/bundle/Vundle.vim
        call vundle#begin('$HOME/vimfiles/bundle/')
    elseif g:isMac
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
    elseif g:isLinux
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
    else
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
    endif

    Plugin 'VundleVim/Vundle.vim'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'Shougo/unite.vim'
    Plugin 'majutsushi/tagbar'
    Plugin 'chrisbra/csv.vim'
    Plugin 'airblade/vim-gitgutter'
"   Plugin 'jmcantrell/vim-virtualenv'
    Plugin 'mbbill/fencview'

    Plugin 'mhinz/vim-startify'
    Plugin 'mhinz/vim-tmuxify'
    Plugin 'mhinz/vim-signify'

    Plugin 'mattn/vimtweak'
"   Plugin 'mattn/transparency-windows-vim'
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

" { markdown plugins
" ------------------
    Plugin 'godlygeek/tabular'
"   Plugin 'plasticboy/vim-markdown'
    Plugin 'vim-pandoc/vim-pandoc'
    Plugin 'vim-pandoc/vim-pandoc-syntax'
    Plugin 'vim-pandoc/vim-pandoc-after'
" }
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
"    Plugin 'msanders/snipmate.vim' deprecated for compatible reasons with YCM
    Plugin 'OmniCppComplete'
    Plugin 'repeat.vim'
    Plugin 'vim-javacompleteex'
    Plugin 'wesleyche/SrcExpl'
    Plugin 'ZoomWin'
    Plugin 'jeroenbourgois/vim-actionscript'
" { color themes
" --------------
    Plugin 'jonathanfilip/lucius'
    Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
" }

" { Adding plugins for nodejs
" ---------------------------
"   Require npm install -g js-beautify
    Plugin 'maksimr/vim-jsbeautify'
    Plugin 'einars/js-beautify'
   " Plugin 'walm/jshint'
" }

" { auto code completion 
" ----------------------
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
" }

    " full screen the window
    Plugin 'derekmcloughlin/gvimfullscreen_win32'
   " Plugin 'jistr/vim-nerdtree-tabs'
    Plugin 'ryanoasis/vim-devicons'
    Plugin 'vim-nginx'

    call vundle#end()           " required
    filetype plugin indent on   " required
" }


" { - 0x03. General Display And Actions.
" ======================================
" set shortmess=atI

" { 3.1. Editing Interface 
" ------------------------
    set number
    set ruler
    set laststatus=2        " always display statusline like airline
    set cmdheight=1

    set cursorline
    hi CursorLine term=underline cterm=underline guibg=#3A3A3A
    hi CursorLine ctermbg=darkgrey guibg=gray13

    set colorcolumn=100
    "hi 

    if g:isGUI
        " au GUIEnter * simalt ~x
        winpos 100 20
        set columns=200
        set lines=60
        set guioptions-=m
        set guioptions-=T
        set guioptions-=r
        set guioptions-=L
    endif
   
    set background=dark
    if g:isWindows
        if g:isGUI
            colorscheme rainbow_neon
            set guifont=MesloLGS_NF:h9:cANSI:qDRAFT
        "
        "    set guifont=Bitstream_Vera_Sans_Mono:h9.5
        "    set guifont=Terminus:h12
        "    set guifontwide=PowerlineSymbols:h10
        "    set guifontwide=Meslo\ LG\ S\ for\ Powerline:h9
        "
            set guifontwide=MesloLGS_NF:h9:cANSI:qDRAFT
        else
            set t_Co=256
            colorscheme industry
            set guifont=Bitstream_Vera_Sans_Mono:h10.5
        endif
    elseif g:isMsys
        if g:isGUI
            colorscheme rainbow_neon
            set t_Co=256
            set guifont=Terminus\ 12
        else
            colorscheme Tomorrow-Night
        endif
    elseif g:isMac
        if g:isGUI
            colorscheme rainbow_neon
            set guifont=MesloLGS_NF:h11
        else
            colorscheme Tomorrow-Night
        endif
    elseif g:isLinux
        set t_Co=256
        if g:isGUI
            colorscheme rainbow_neon
            set guifont=Terminus\ 12
        else
            colorscheme Tomorrow-Night
        endif
    else
    endif
    
    set lazyredraw       " Fix the problems for scrolling slowly
    set modifiable       " Fix E21: in NerdTree
" }


" { 3.2. Tabs and Indent 
" ----------------------
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


" { 3.3. Search Options 
" ---------------------
    set showmatch
    set incsearch
    set ignorecase
    set smartcase
    set hlsearch
" }


" { 3.4. File Options 
" -------------------
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

    if g:isWindows
        set fileformat=dos
        set fileformats=dos,unix,mac
    elseif g:isMsys
        set fileformat=unix
        set fileformats=unix,dos,mac
    elseif g:isMac
        set fileformat=mac
        set fileformats=mac,dos,unix
    elseif g:isLinux
        set fileformat=unix
        set fileformats=unix,mac,dos
    else
    endif

    set formatoptions=croql
    set backspace=indent,eol,start
" } 

" { 3.5. Code Folding
" -------------------
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
" }


" { 3.6. Text Wrapping 
" --------------------
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
" }

"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)


" { 3.7. Pretreatment
" -------------------
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
" }



" { - 0x04. SETTINGS FOR PLUGINS.
" ===============================


" { 4.1. plugins.vim-airline/vim-airline
" --------------------------------------
    let g:airline_theme ='cool'   " 'powerlineish'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:Powerline_symbols = 'fancy'
    set t_Co=256
    set fillchars+=stl:\ ,stlnc:\
    set laststatus=2

    let g:airline_powerline_fonts = 1
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    nnoremap <C-N> :bn<CR>
    nnoremap <C-P> :bp<CR>
" }


" { 4.2. plugins.yggdroot/indentline 
" ----------------------------------
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

" { 4.3. plugins.scrooloose/nerdtree 
" ----------------------------------
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


" { 4.4. plugins.derekmcloughlin/gvimfullscreen_win32 
" ---------------------------------------------------
    map <F11> <Esc>:call libcallnr('gvimfullscreen.dll',
                \ 'ToggleFullScreen', 0)<CR><C-L>
" }

" { 4.5. plugins.mattn/vimtweak
" -----------------------------
    if g:isWindows && g:isGUI
        "let g:alpha_value=242
        "call libcallnr("vimtweak.dll", "SetAlpha", 235)
        "call libcallnr("vimtweak.dll", "EnableMaximize", 1)
        "call libcallnr("vimtweak.dll", "EnableCaption", 1)
        "call libcallnr("vimtweak.dll", "EnableTopMost", 0)

        "autocmd FocusGained * call libcallnr("vimtweak.dll", "SetAlpha", 235)
        autocmd FocusGained * call libcallnr("vimtweak.dll", "SetAlpha", 242)
        autocmd FocusLost * call libcallnr("vimtweak.dll", "SetAlpha", 166)
        
        "function TweakWindowAlphaM(alpha_mod, sign)
        "    if sign == 1
        "        let g:alpha_value=g:alpha_value + alpha_mod
        "    elseif sign == 0
        "        let g:alpha_value=g:alpha_value - alpha_mod
        "    else
        "    endif
        "    if g:alpha_value<200
        "        let g:alpha_value=200
        "    endif
        "    if g:alpha_value>255
        "        let g:alpah_value=255
        "    endif
        "    call libcallnr('vimtweak.dll', 'SetAlpha', g:alpha_value)
        "endfunction

    "    function! s:Transparency(v)
    "        call libcallnr('vimtweak.dll', 'SetAlpha', 235) 
    "    endfunction
    "    augroup transparency_windows
    "      autocmd!
    "    augroup END
    endif
    map <F10> <Esc>:call libcallnr('vimtweak.dll', 'SetAlpha', 200)<CR>
    "map <F10> <Esc>:call TweakWindowAlphaM(10,1)<CR>
    map <S-F10> <Esc>:call libcallnr('vimtweak.dll', 'SetAlpha', 242)<CR>
    "map <S-F10> <Esc>:call TweakWindowAlphaM(10, 0)<CR>
	map <C-S-F10> <Esc>:call libcallnr('vimtweak.dll', 'SetAlpha', 255)<CR>
" }


" { 4.6. Modify the Window Size
" -----------------------------
    map <F12>   <Esc>:set columns=100<CR><Esc>:set lines=32<CR>
    map <S-F12> <Esc>:set columns=160<CR><Esc>:set lines=48<CR>
" }


" { 4.7. plugins.maksimr/vim-jsbeautify
" ----------------------------------
    if (g:isWindows || g:isMsys)
        let g:editorconfig_Beautifier=expand('$HOME/vimfiles/.editorconfig')
	elseif (g:isMac || g:isLinux)
        let g:editorconfig_Beautifier=expand('$HOME/.vim/.editorconfig')
	else
    endif
" }



" { 4.8. plugins.for.markdown
" ---------------------------
" - plasticboy/vim-markdown 
" - 
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


" { 4.9. Plugins.scrooloose/syntastic 
" -----------------------------------
    set statusline+=%#warningmsg#
    if g:isWindows
        set statusline+=%{SyntasticStatuslineFlag()}
    endif
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    if g:isWindows
        let g:syntastic_python_python_exec = 'C:/Python27/'
    endif

    let g:syntastic_javascript_checkers = ['jshint']
" }


" { 4.10. plugins.kien/ctrlp 
" --------------------------
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


" { 4.11. plugins.Valloric/YouCompleteMe
" --------------------------------------

    let g:ycm_complete_in_comments = 1
    let g:ycm_complete_in_strings = 1
    let g:ycm_seed_identifiers_with_syntax = 1
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_key_list_select_completion = ['<tab>', '<c-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_server_python_interpreter = 'C:\Python35\python.exe'
    "let $PYTHONPATH = "C:\\Program\ Files\\Python35\\Lib;C:\\Program\ Files\\Python35\\DLLs"



"   make YCM compatible with UltiSnips (using supertab)
"   let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"   let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"   let g:SuperTabDefaultCompletionType = '<C-n>'
"
"   better key bindings for UltiSnipsExpandTrigger
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<c-b>"
    let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
    let g:UltiSnipsEditSplit="vertical"

"    set completeopt=longest,menu
"    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"    inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"    inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"    inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"    inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"    inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
"
"    "youcompleteme  default tab  s-tab is comfict with vim autocomplete
"    "let g:ycm_key_list_select_completion=['<c-n>']
"    let g:ycm_key_list_select_completion = ['<Tab>']
"    "let g:ycm_key_list_previous_completion=['<c-p>']
"    let g:ycm_key_list_previous_completion = ['<Up>']
"    let g:ycm_confirm_extra_conf=0   " close load .ycm_extra_conf.py notice
"
"    let g:ycm_collect_identifiers_from_tags_files=1 
"    let g:ycm_min_num_of_chars_for_completion=2 
"    let g:ycm_cache_omnifunc=0  
"    let g:ycm_seed_identifiers_with_syntax=1    
"     nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
"    nnoremap <leader>lo :lopen<CR> "open locationlist
" }





" { 4.12. plugins.mhinz/vim-startify
" ----------------------------------
    let g:startify_custom_header = [
            \ '  +--------------------------------------------------------------------------+   ',
            \ ' /             --= NICK''s RESEARCH AND DEVELOPMENT STUDIO  =--                \  ',
            \ ' |                          f911@fatework.io                                  | ',
            \ ' |                          _            ___   ___                            | ',
            \ ' |                   __   _(_)_ __ ___  ( _ ) / _ \                           | ',
            \ ' |                   \ \ / / | ''_ ` _ \ / _ \| | | |                          | ',
            \ ' |                    \ V /| | | | | | | (_) | |_| |                          | ',
            \ ' |                     \_/ |_|_| |_| |_|\___(_)___/                           | ',
            \ ' |                                                                            | ',
            \ ' +----------------------------------------------------------------------------+ ',
            \ ' |                                                                            |',
            \ '',
            \ ]
    let g:startify_custom_footer = [
            \ ' |                                                                            | ',
            \ ' |                          f911@fatework.io                                  | ',
            \ ' /             --=  NICK''s RESEARCH AND DEVELOPMENT STUDIO  =--               \  ',
            \ '  +--------------------------------------------------------------------------+ ',
            \ '',
            \ ]
    map <leader>st <Esc>:Startify<CR>
" }


" { - 0x05. Map Common Keyboard Shortcuts. 
" ========================================

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
        nmap <leader>e :tabnew $HOME/vimfiles/vimrc<CR>
    elseif g:isMsys
        nmap <leader>e :tabnew $HOME/vimfiles/vimrc<CR>
    else
        nmap <leader>e :tabnew ~/.vim/vimrc<CR>
    endif
    
    nmap <leader>t :tabnew<CR>
    nmap <leader>nl <ESC>:nohl<CR>
    map <leader>up <Esc>:PluginUpdate<CR>
    
    nmap <C-Tab> <Esc>gt
    nmap <C-S-Tab> <Esc>gT
    imap <C-Tab> <Esc>gt
    imap <C-S-Tab> <Esc>gT
    nnoremap K i<CR><Esc>
    map  <leader>w <Esc><C-W><C-W>
    map <F9> <Esc>:w<CR>:!node %<CR>
    
    "map <leader> <Esc>:w<CR><Esc>:so $HOME/_vimrc<CR><Esc>:PluginUpdate<CR>
    "nnoremap <leader>gq :%!pandoc -f html -t markdown <bar> pandoc -f markdown -t html<CR>
    "vnoremap <leader>gq :!pandoc -f html -t markdown <bar> pandoc -f markdown -t html<CR>
" }

" { fix messy code problem
" ------------------------
    set langmenu=en_US.UTF-8
    let $LANG='en_US.utf-8'
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
" }

" vim: se ai si et ts=4 sw=4 ft=vim :
" EOF
