
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

