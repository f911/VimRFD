
" 0x02. **VIM-PLUG** The Vim Plugin System.
" =========================================
"
"
" Interface:
" ---------- 
" * IMPORT:
"    + platform/GetOSType()
" * EXPORT:
"    + $MYVIMDIR
"
" * export g:isGUI, g:isX64, g:isWindows, g:isMsys, g:isMac, g:isLinux
"
"
" Sketch:
" -------
" ```text
"  +-----------------------------+
"  | If Not Exists,              |
"  | First Auto Install vim-plug |
"  +-----------------------------+
"               |
"  +---------------------------+
"  | Update Plugins & vim-plug |
"  +---------------------------+ -->-->---+
"  | Update vim-plug By `cp`   |          V
"  +---------------------------+  [ can be repeated ]
"               |                         V
"               A------------<--<--<--<---+
"               |
"  +------------------------+
"  | Plugin Config & Invoke |
"  +------------------------+
" ```
" Procedure:
" ---------
"
" (EOC)

" envrionment variables
let $MYVIMDIR = $HOME.((GetOSType() == "win") ? '\vimfiles\' : '/.vim/') 
let s:bundled = $MYVIMDIR.'bundle'.Ops()


silent function! FirstAutoInstall(ostyp)
    if empty(glob("$MYVIMDIR/autoload/plug.vim")) 
        if ( a:ostyp == 'linux' ) || ( a:ostyp == 'mac' )
            silent !curl -fLo $MYVIMDIR/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        elseif
            echoerr 'You need to download vim-plug first.'
        endif
    endif
endfunction


" TODO: need test on various os.
silent function! EveryManualUpdate(ostyp)
    if a:ostyp == 'win'
        silent xcopy glob('s:bundled/vim-plug/plug.vim') glob('$MYVIMDIR/autoload/plug.vim')
        " elseif
    endif
endfunction

call FirstAutoInstall(GetOSType())



" vim-plug global options
let g:plug_timeout = 120


call plug#begin(s:bundled)

" + looks and productivity {
" --------------------------
Plug 'junegunn/vim-plug'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/unite.vim'
Plug 'majutsushi/tagbar'
Plug 'jszakmeister/markdown2ctags'
Plug 'chrisbra/csv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'severin-lemaignan/vim-minimap'
"   Plug 'jmcantrell/vim-virtualenv'
Plug 'mbbill/fencview'
Plug 'mbbill/undotree'
" }
"Plug 'chrisbra/unicode.vim', { 'on': ['<plug>(UnicodeComplete)', '<plug>(UnicodeGA)', 'UnicodeTable'] }
Plug 'chrisbra/unicode.vim'

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
"Plug 'scrooloose/syntastic'

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
" Plug 'chemzqm/vim-run'
"

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'idanarye/vim-vebugger'

Plug 'aklt/plantuml-syntax'
call plug#end()
" no need to toggle fileindent options

if !empty(glob("$MYVIMRCD/pluginconf.vim"))
    source $MYVIMRCD/pluginconf.vim
endif


" vim:cin:et:ts=4:sts=4:tw=98:ft=vim:ff=unix:fenc=utf-8:
" EOF
