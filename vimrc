" ==============================================================================
"           F911'S RESEARCH AND DEVELOPMENT STUDIO PRODUCED ( F911-R&D.SP )               
" ------------------------------------------------------------------------------
" Project:  VimRFD - VIM Refined
" FileDes:  Contains settings to initialize VIM when it starts. customize the 
"           way VIM run as. This file acts like a 'facade' to load other VIM
"           custom config files. Location usually comes to: >
"
"               ~/.vim/vimrc (Linux & Mac OS X)
"               %HOME%/vimfiles/vimrc (Windows)
"               $HOME/vimfiles/vimrc (Msys on Windows)
"           <
" Creator:  F911 <0xf911@gmail.com> [GI+](https://github.com/f911)
" Created:  2014-10-04
" LastMod:  2018-01-29 PM                                               |.|0|.|
" Version:  v1.5.6                                                      |.|.|0|
" License:  [(CC BY-ND 4.0)][1]                                         |0|0|0|
" =============================================================================
"
" Sections:
" + 0x01. Global Variable Definitions.
" + 0x02. VIM-PLUG The Vim Plugin System.
" + 0x03. General Display And Action Styles.
" + 0x04. Setting For Plugins.
" + 0x05. Key Mappings.
"
" FileTypeSupport:
" + python
" + vim
" + c
" + html
" + nodejs
" + markdown
" + java
"
" KeyMapList:
" + F2 -- NerdTreeToggle
" + F3 -- TagbarToggle 
" + 
" 
" TODO_List:
" + js's plugins configuration. and .editorconfig missing error.
" + An excellent README is needed for this project and others
" + Key mappings need readjusments.
"
" Import:
"     vim builtin variables and functions
" Export:
"   + $MYVIMRCD


" BEGIN:

set nocompatible

" suppose $MYVIMRC is not empty, otherwise this vimrc file would not be
" loaded and no script as well as plugins will be execute, also safe.
if empty($MYVIMRCD)
    let $MYVIMRCD = $MYVIMRC.'_d'              " usually $HOME/.vim/vimrc_d
endif
" TODO: Ops() first ?
source $MYVIMRCD/platforms.vim 
source $MYVIMRCD/pluginmgmt.vim          " load external plugin by vim-plug
source $MYVIMRCD/customlook.vim         " 
source $MYVIMRCD/apphelper.vim          " functions for custom handlers
source $MYVIMRCD/fthandler.vim           " ft & ff & fenc etc.
source $MYVIMRCD/keymaps.vim
source $MYVIMRCD/startify.vim
source $MYVIMRCD/custommood.vim

set verbose=0

if $LANG != 'en_US.utf-8'
    let $LANG='en_US.utf-8'
    set langmenu=en_US.UTF-8
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif



" Reference:
" + [oschina](http://www.oschina.net/code/snippet_574132_13357)
" + [github-dotfile-dotrc](https://github.com)
" + [vim-wikia](http://vim.wikia.com/wiki/Vim_Tips_Wiki)
" + [1]: https://creativecommons.org/licenses/by-nd/4.0/ 

" vim:noeol:cin:sr:et:ts=4:sw=4:tw=98:ft=vim:ff=unix:fenc=utf-8:
" EOF
