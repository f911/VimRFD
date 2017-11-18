" ==============================================================================
" F911'S RESEARCH AND DEVELOPMENT STUDIO PRODUCED ( F911-R&D.SP )               
" ------------------------------------------------------------------------------
" Project:  vimfiles - vim resource files' directory
" FileDes:  This file contains optional runtime configuration settings to
"           initialize Vim when it starts. It can customize the way vim run as. 
"           The location usually comes to:
"           ~/.vim/vimrc on Linux and Mac OS X or \
"           %HOME%/vimfiles/vimrc on Windows or \
"           $HOME/vimfiles/vimrc on Msys
" Creator:  F911 <0xf911@gmail.com> [GI+](https://github.com/f911)
" Created:  2014-10-04
" LastMod:  2017-11-13                                                  |.|0|.|
" Version:  v1.5.3                                                      |.|.|0|
" License:  MIT (c)                                                     |0|0|0|
" =============================================================================

" Platforms:
" + Windows / MSYS
" + Linux: test on CentOS / Ubuntu / Kali / Fedora
" + Mac OS X

" Sections:
" + 0x01. Global Variable Definitions.
" + 0x02. VIM-PLUG The Vim Plugin System.
" + 0x03. General Display And Action Styles.
" + 0x04. Setting For Plugins.
" + 0x05. Key Mappings.

" Features:
" + c/c++/bash
" + vbscript 
" + actionscript
" + markdown
" + nodejs
" + YouCompleteMe (BugsFixed:python_interpreter_path:2016-11-07)
" + NerdFonts

" Changes:
" + Adding YouCompleteMe Supports on Windows
" + Can self compile the gvim-x64 using vs2015
" + Add $HOME=X:\home to user environment variable, and $HOME\vimfiles\bin to PATH
" + Accordingly change the user $PATH to right vimfiles\bin
" + Update for vimtweak, 64 / 32
" + [Disable beeping](http://vim.wikia.com/wiki/Disable_beeping)
" + Upgrade to VIM 8.0 by both source building and packge installation.
" + Change plugin manager from Vundle to vim-plug, thanks Vundle, which still inspirational.
" + Adding YouCompleteMe requirements illustruction, now ./install.py --all is OK.
" + Change file header style, drop old Copyright hug new License and Banner for honour.
" + Change comments' style to Markdown syntax like.


" TODO_List:
" + js's plugins configuration. and .editorconfig missing error.
" + An excellent README is needed for this project and others
" + Key mappings need readjusments.

" Reference:
" + [oschina](http://www.oschina.net/code/snippet_574132_13357)
" + [github-dotfile-dotrc](https://github.com)
" + [vim-wikia](http://vim.wikia.com/wiki/Vim_Tips_Wiki)

" Debugging:
" + feature:
"   - use `:help feature-list` to see all feature list, 
"   - and `:version` to show which has clear about `options` and `features` 
"   - use has({feature}) function like `:echo has("unix")` in vim-script's 
"     program.
" + option:
"   - use `:se OPTION` like `se ft` to show current vim option setting
" + variable:
"   - use `:echo VAR` like `echo g:isMac` or `echo $HOME` to show vim-script's
"     variable value or environment variables' value
" + mapping:
"   - use `:map` to list all currrent key mapping
" + unknowns
"   - use [vim-wikia](http://vim.wikia.com/wiki/Vim_Tips_Wiki) for more tips
"   - and [sof](https://stackoverflow.com/tags/vim/info) for community help



" * **0x01. Global Variable Definitions.**
" ========================================
"
" Detect OS type, GUI environment and set the base variables, this vim resource file
" support platform can be bellow:
"
" +-----------+-----------+------------+------------+---------+
" |           | isWindows | isMsys     | isMac      | isLinux |
" +-----------+-----------+------------+------------+---------+
" | isGUI     |   usual   |  ---       | occasional |  rare   |
" +-----------+-----------+------------+------------+---------+
" | isConsole |   rare    | occasional | usual      |  hot    |
" +-----------+-----------+------------+------------+---------+
"     _tab1-1:supported platforms_
" "
    set nocompatible
    let g:isWindows = 0
    let g:isMsys    = 0
    let g:isMac     = 0
    let g:isLinux   = 0
    let g:isGUI     = 0  " else isConsole
    
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



" * ** 0x02. VIM-PLUG The Vim Plugin System.**
" ============================================
"
" see :h vim-plug for more details
" useful commands from vim-plug README.md
" +-------------------------------+---------------------------------------------+
" | Command                       | Description                                 |
" |-------------------------------+---------------------------------------------+
" | PlugInstall [name] [#threads] | Install plugins                             |
" | PlugUpdate [name] [#threads]  | Install or update plugins                   |
" | PlugClean[!]                  | Remove unused directories \                 |
" |                               | (bang version will clean without prompt)    |
" | PlugUpgrade                   | Upgrade vim-plug itself                     |
" | PlugStatus                    | Check the status of plugins                 |
" | PlugDiff                      | Examine changes from the previous update \  |
" |                               | and the pending changes                     |
" | PlugSnapshot[!] [output path] | Generate script for restoring the current \ |
" |                               | snapshot of the plugins                     |
" +-------------------------------+---------------------------------------------+
"     _tab2-1:vim-plug commands_
" "
    filetype off
    if g:isWindows 
        "set rtp+=$HOME/vimfiles/bundle/Vundle.vim/ x
        "call vundle#begin('$HOME/vimfiles/bundle/') x
        call plug#begin('$HOME/vimfiles/plugged')
    elseif g:isMsys
        "set rtp+=$HOME/vimfiles/bundle/Vundle.vim x
        "call vundle#begin('$HOME/vimfiles/bundle/') x
        call plug#begin('$HOME/vimfiles/plugged')
    elseif g:isMac
        "set rtp+=~/.vim/bundle/Vundle.vim x
        "call vundle#begin() x
        call plug#begin('~/.vim/plugged')
    elseif g:isLinux
        "set rtp+=~/.vim/bundle/Vundle.vim x
        "call vundle#begin() x
        call plug#begin('~/.vim/plugged')
    else
        "set rtp+=~/.vim/bundle/Vundle.vim x
        "call vundle#begin() x
        call plug#begin('~/.vim/plugged')
    endif

"   Plugin 'VundleVim/Vundle.vim'x

" + looks and productivity {
" --------------------------
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'Shougo/unite.vim'
    Plug 'majutsushi/tagbar'
    Plug 'chrisbra/csv.vim'
    Plug 'airblade/vim-gitgutter'
"   Plug 'jmcantrell/vim-virtualenv'
    Plug 'mbbill/fencview'
    Plug 'mbbill/undotree'
" }
 
    Plug 'mhinz/vim-startify'
    Plug 'mhinz/vim-tmuxify'
    Plug 'mhinz/vim-signify'

    Plug 'mattn/vimtweak'
"   Plug 'mattn/transparency-windows-vim'
    Plug 'mattn/emmet-vim'
    
    Plug 'edkolev/tmuxline.vim'
    Plug 'edkolev/promptline.vim'

    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/syntastic'
   
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'

    Plug 'xolox/vim-shell'
    Plug 'xolox/vim-misc'

" + color themes {
" ----------------
    Plug 'jonathanfilip/lucius'
    "Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'} o
    Plug 'chriskempson/base16-vim' 
" }

    Plug 'idanarye/vim-vebugger'

" + auto code completion {
" ------------------------
    Plug 'Valloric/YouCompleteMe' 
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
" }

"   full screen the window
    Plug 'derekmcloughlin/gvimfullscreen_win32'
"   Plug 'jistr/vim-nerdtree-tabs'
    Plug 'ryanoasis/vim-devicons'

" + markdown plugins {
" --------------------
    Plug 'godlygeek/tabular'
"   Plug 'plasticboy/vim-markdown'
    Plug 'vim-pandoc/vim-pandoc', {'for': 'markdown'}
    Plug 'vim-pandoc/vim-pandoc-syntax', {'for': 'markdown'} 
    Plug 'vim-pandoc/vim-pandoc-after', {'for': 'markdown'}
    Plug 'iamcco/mathjax-support-for-mkdp', {'for': 'markdown'}
    Plug 'iamcco/markdown-preview.vim', {'for': 'markdown'}
" }
    Plug 'Yggdroot/indentLine'
"   Plug 'a.vim'o
    Plug 'vim-scripts/Align'
    Plug 'vim-scripts/bufexplorer.zip'
    Plug 'vim-scripts/ccvext.vim'
    Plug 'vim-scripts/cSyntaxAfter'
    Plug 'chase/vim-ansible-yaml'
    
    Plug 'jiangmiao/auto-pairs'
    Plug 'vim-scripts/std_c.zip'
    Plug 'Shougo/neocomplcache.vim'
    Plug 'vim-scripts/taglist.vim'
    Plug 'vim-scripts/TxtBrowser'
    Plug 'vim-scripts/Mark--Karkat'
"   Plugin 'msanders/snipmate.vim' deprecated for compatible reasons with YCM
    Plug 'vim-scripts/OmniCppComplete'
    Plug 'vim-scripts/repeat.vim'
    Plug 'artur-shaik/vim-javacomplete2'
    Plug 'wesleyche/SrcExpl'
    Plug 'vim-scripts/ZoomWin'
    Plug 'jeroenbourgois/vim-actionscript'

" + Adding plugins for nodejs {
" -----------------------------
"   Require npm install -g js-beautify
"   Plug 'maksimr/vim-jsbeautify'
    Plug 'einars/js-beautify'
"   Plug 'walm/jshint'
" }

    Plug 'nginx/nginx', {'for': 'nginx', 'rtp': 'contrib/vim/'} 

    Plug 'asins/vimcdoc'
    Plug 'junegunn/vim-emoji'

    call plug#end()
    filetype plugin indent on   " required

" }



" * **0x03. General Display And Action Styles.**
" ==============================================

" + 3.1. Editing Interface {
" --------------------------
    set number
    set ruler
    set laststatus=2        " always display statusline like airline
    set cmdheight=1

"   set shortmess=atI
    set cursorline
    hi CursorLine term=underline cterm=underline guibg=#3A3A3A
    hi CursorLine ctermbg=darkgrey guibg=gray13

    set colorcolumn=100

if g:isGUI
    " au GUIEnter * simalt ~x
    winpos 400 200
    set columns=200
    set lines=68
    set guioptions-=m  " use :se go+=m to recall menu
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L

    augroup VCenterCursor
        au!
        au BufEnter,WinEnter,WinNew,VimResized *,*.*
                    \ let &scrolloff=winheight(win_getid())/2
    augroup END

    function WindowCenterInScreen()
        set lines=9999 columns=9999
        let g:windowsSizeFixX = 58
        let g:windowsSizeFixY = 118
        let g:windowsScaleX   = 7.75
        let g:windowsScaleY   = 17.0
        let g:windowsPosOldX = getwinposx()
        let g:windowsPosOldY = getwinposy()
        let g:windowsScreenWidth  = float2nr(winwidth(0) * g:windowsScaleX) + \
                                    g:windowsPosOldX + g:windowsSizeFixX
        let g:windowsScreenHeight = float2nr(winheight(0) * g:windowsScaleY) + \
                                    g:windowsPosOldY + g:windowsSizeFixY
        set lines=60 columns=200
        let g:windowsSizeWidth = float2nr(winwidth(0) * g:windowsScaleX) + g:windowsSizeFixX
        let g:windowsSizeHeight = float2nr(winheight(0) * g:windowsScaleY) + g:windowsSizeFixY
        let g:windowsPosX = ((g:windowsScreenWidth - g:windowsSizeWidth) / 2)
        let g:windowsPosY = ((g:windowsScreenHeight - g:windowsSizeHeight) / 2)
        "exec ':winpos ' g:windowsPosX ' ' g:windowsPosY
        exec ':winpos ' 200  ' ' 400
    endfunc
    "au GUIEnter * call WindowCenterInScreen()

    "au! VCenterCursor
    "au VimEnter * normal zz
endif
   
    set background=dark
    if g:isWindows
        if g:isGUI
            "colorscheme rainbow_neon
            colorscheme Tomorrow-Night-Eighties
            set guifont=MesloLGS_NF:h9:cANSI:qDRAFT
        "
        "    set guifont=Bitstream_Vera_Sans_Mono:h9.5
        "    set guifont=Terminus:h12
        "    set guifontwide=PowerlineSymbols:h10
        "    set guifontwide=Meslo\ LG\ S\ for\ Powerline:h9
        "
            "set guifontwide=MesloLGS_NF:h9:cANSI:qDRAFT
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
            set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h11
        endif
    elseif g:isLinux
        set t_Co=256
        if g:isGUI
            "colorscheme rainbow_neon
            "set guifont=Terminus\ 12
            "set guifont=Terminess\ Powerline\ 12
            set guifont=xos4\ Terminess\ Powerline\ 10
            "colorscheme Tomorrow-Night-Eighties
            colorscheme base16-tomorrow-night
        else
            "colorscheme Tomorrow-Night
            colorscheme base16-tomorrow-night
        endif
    else
    endif
    
    set lazyredraw       " Fix the problems for scrolling slowly
    set modifiable       " Fix E21: in NerdTree
" }
let base16colorspace=256

" + 3.2. Tabs and Indent {
" ------------------------
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set cindent
    set smartindent
    set autoindent
    " Except for Makefiles; hard tabs of width 2
    au FileType make set ts=2
    " And Markdown
" }


" + 3.3. Search Options {
" -----------------------
    set showmatch
    set incsearch
    set ignorecase
    set smartcase
    set hlsearch
" }


" + 3.4. File Options {
" ---------------------
    syntax on
    filetype on
    filetype plugin on
    filetype indent on
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

" + 3.5. Code Folding {
" ---------------------
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


" + 3.6. Text Wrapping {
" ----------------------
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

" au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

" + 3.7. Disable Beeping {
" ------------------------
    set noerrorbells visualbell t_vb=
    autocmd GUIEnter * set visualbell t_vb=
" }

" + 3.8. Pretreatment {
" ---------------------

" - Opening Vim help in a vertical split window
"   [sof](https://stackoverflow.com/questions/630884/opening-vim-help-in-a-vertical-split-window)
    autocmd FileType help wincmd L
" }

" + 3.9. Make And Build {
" -----------------------
    autocmd FileType python setlocal makeprg=python\ % 
    if g:isWindows
     "   autocmd FileType markdown setlocal makeprg=start "$ProgramFiles/Typora/Typora.exe"\ %
        autocmd FileType markdown nmap <leader>mk :!start "C:/Program Files/Typora/Typora.exe"\ %<cr>
    endif
" }


" + 3.A. vim-commentary
" ---------------------
autocmd FileType apache setlocal commentstring=#\ %s


" * **0x04. Setting For Plugins.**
" ================================


" + vim-emoji
" -----------

" for e in emoji#list()
"   call append(line('$'), printf('%s (%s)', emoji#for(e), e))
" endfor
" set completefunc=emoji#complete


" + 4.1 plugins.vim-airline/vim-airline {
" ---------------------------------------
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

" + 4.2. plugins.yggdroot/indentline {
" ------------------------------------
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

" + 4.3. plugins.scrooloose/nerdtree {
" ------------------------------------
    autocmd bufenter * if (winnr("$") == 1 && 
                \ exists("b:NERDTreeType") && 
                \ b:NERDTreeType == "primary") | q | 
                \ endif
    if g:isWindows
        let g:NERDTreeCopyCmd = 'copy '
    else
        let g:NERDTreeCopyCmd = 'cp -r'
    endif
    let g:NERDTreeMouseMode = 2
    let g:NERDTreeWinSize   = 40
    let g:NERDTreeMinimalUI = 1
    let g:NERDTreeIgnore    = ['\*NTUSER*','\*ntuser*','\NTUSER.DAT','\ntuser.ini']

    nmap <F2> :NERDTreeToggle .<CR>
" }

" + 4.4. plugins.derekmcloughlin/gvimfullscreen_win32 {
" -----------------------------------------------------
    if g:isWindows && g:isGUI
        map <F11> <Esc>:call libcallnr('gvimfullscreen.dll',
                \ 'ToggleFullScreen', 0)<CR><C-L>
    endif
" }

" + 4.5. plugins.mattn/vimtweak { 
" -------------------------------
    if g:isWindows && g:isGUI
        "let g:alpha_value=242
        "call libcallnr("vimtweak.dll", "SetAlpha", 235)
        " call libcallnr("vimtweak64.dll", "EnableMaximize", 1)
        "call libcallnr("vimtweak.dll", "EnableCaption", 1)
        "call libcallnr("vimtweak.dll", "EnableTopMost", 0)

        "autocmd FocusGained * call libcallnr("vimtweak.dll", "SetAlpha", 235)
        autocmd FocusGained * call libcallnr("vimtweak64.dll", "SetAlpha", 242)
        autocmd FocusLost * call libcallnr("vimtweak64.dll", "SetAlpha", 166)
        
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
        map <F10> <Esc>:call libcallnr('vimtweak64.dll', 'SetAlpha', 200)<CR>
        "map <F10> <Esc>:call TweakWindowAlphaM(10,1)<CR>
        map <S-F10> <Esc>:call libcallnr('vimtweak64.dll', 'SetAlpha', 242)<CR>
        "map <S-F10> <Esc>:call TweakWindowAlphaM(10, 0)<CR>
	    map <C-S-F10> <Esc>:call libcallnr('vimtweak64.dll', 'SetAlpha', 255)<CR>
    endif
" }


" + 4.6. Modify the Window Size {
" -------------------------------
    map <F12>   <Esc>:set columns=100<CR><Esc>:set lines=32<CR>
    map <S-F12> <Esc>:set columns=160<CR><Esc>:set lines=48<CR>
" }


" + 4.7. plugins.mbbill/undotree {
" --------------------------------
    if has("persistent_undo")
        set undodir=$HOME/.undo/
        set undofile
        nnoremap <F5> :UndotreeToggle<CR>
    endif
" }

" + 4.8. plugins.maksimr/vim-jsbeautify {
" ---------------------------------------
    if (g:isWindows || g:isMsys)
        let g:editorconfig_Beautifier=expand('$HOME/vimfiles/.editorconfig')
	elseif (g:isMac || g:isLinux)
        let g:editorconfig_Beautifier=expand('$HOME/.vim/.editorconfig')
	else
        let g:editorconfig_Beautifier=expand('$HOME/.vim/.editorconfig')
    endif
" }



" + 4.9. plugins.for.markdown {
" -----------------------------
" - plasticboy/vim-markdown 
" - 
"   au BufNewFile,BufFilePre,BufRead *.md setf markdown
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


" + 4.10. Plugins.scrooloose/syntastic {
" --------------------------------------
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
        let g:syntastic_python_python_exec = 'C:/Python36/'
    endif

    let g:syntastic_javascript_checkers = ['jshint']
" }


" + 4.11. plugins.kien/ctrlp {
" ----------------------------
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


" + 4.12. plugins.Valloric/YouCompleteMe {
" ----------------------------------------
"
"   After vim-plug first install this plugin, you need to update submodules and install 
"   required components, if you want to execute ./install.py --all satisfactorily. Of cause,
"   different OS platform use different package manager. example commands may be bellow:
" 
"       cd ~/.vim/plugged/YouCompleteMe
"       git submodule update --init --recursive
"       sudo dnf install -y automake gcc gcc-c++ kernel-devel cmake \
"                           python-devel python3-devel nodejs nodejs-devel \
"                           go rust cargo cargo-devel

    let g:ycm_complete_in_comments = 1
    let g:ycm_complete_in_strings = 1
    let g:ycm_seed_identifiers_with_syntax = 1
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_key_list_select_completion = ['<tab>', '<c-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
    let g:ycm_confirm_extra_conf = 0
    if g:isWindows
        let g:ycm_server_python_interpreter = 'C:/Python36/python.exe'
    endif

"   @deprecated:
"   ------------
"   make YCM compatible with UltiSnips (using supertab)
"   let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"   let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"   let g:SuperTabDefaultCompletionType = '<C-n>'
"
"   better key bindings for UltiSnipsExpandTrigger
"   let g:UltiSnipsExpandTrigger = "<tab>"
"   let g:UltiSnipsJumpForwardTrigger = "<c-b>"
"   let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
"   let g:UltiSnipsEditSplit="vertical"

"   set completeopt=longest,menu
"   autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"   inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"   inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"   inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"   inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"   inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
"
"   "youcompleteme  default tab  s-tab is comfict with vim autocomplete
"   "let g:ycm_key_list_select_completion=['<c-n>']
"   let g:ycm_key_list_select_completion = ['<Tab>']
"   "let g:ycm_key_list_previous_completion=['<c-p>']
"   let g:ycm_key_list_previous_completion = ['<Up>']
"   let g:ycm_confirm_extra_conf=0   " close load .ycm_extra_conf.py notice
"
"   let g:ycm_collect_identifiers_from_tags_files=1 
"   let g:ycm_min_num_of_chars_for_completion=2 
"   let g:ycm_cache_omnifunc=0  
"   let g:ycm_seed_identifiers_with_syntax=1    
"    nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
"   nnoremap <leader>lo :lopen<CR> "open locationlist
" }





" + 4.13. plugins.mhinz/vim-startify {
" ------------------------------------
"
    let g:startify_custom_header = [
        \ '  +--------------------------------------------------------------------------+   ',
        \ ' / =*=[ F911''S RESEARCH AND DEVELOPMENT STUDIO PRODUCED ( F911-R&D.SP ) ]=*=  \  ',
        \ ' |----------------------------------------------------------------------------| ',
        \ ' |              ██╗   ██╗██╗███╗   ███╗     █████╗     ██████╗                | ',   
        \ ' |              ██║   ██║██║████╗ ████║    ██╔══██╗   ██╔═████╗               | ',  
        \ ' |              ██║   ██║██║██╔████╔██║    ╚█████╔╝   ██║██╔██║               | ',  
        \ ' |              ╚██╗ ██╔╝██║██║╚██╔╝██║    ██╔══██╗   ████╔╝██║               | ',  
        \ ' |               ╚████╔╝ ██║██║ ╚═╝ ██║    ╚█████╔╝██╗╚██████╔╝               | ',  
        \ ' |                ╚═══╝  ╚═╝╚═╝     ╚═╝     ╚════╝ ╚═╝ ╚═════╝                | ',  
        \ ' +----------------------------------------------------------------------------+ ',
        \ ' |                                                                            |',
        \ '',
        \ ]
    let g:startify_custom_footer = [
        \ ' |                                                                            | ',
        \ ' |----------------------------------------------------------------------------| ',
        \ ' \ =*=[ F911''S RESEARCH AND DEVELOPMENT STUDIO PRODUCED ( F911-R&D.SP ) ]=*= /  ',
        \ '  +--------------------------------------------------------------------------+ ',
        \ '',
        \ ]
    map <leader>st <Esc>:Startify<CR>
" }




"autocmd BufNewFile *.py 0r $HOME/.vim/template/python.tlp
set verbose=0
" + fix messy code problem {
" --------------------------
    set langmenu=en_US.UTF-8
    let $LANG='en_US.utf-8'
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
" }

" vim:ai:si:et:ts=4:sw=4:ft=vim:ff=unix:fenc=utf-8:norl:
" EOF
