" $MYVIMFTH/cpp_hdl.vim 
" Recommend keymap layout on Fn area.
"
"                              |                             |
"   +--+   +--+   +--+   +--+  |  +--+   +--+   +--+   +--+  |  +---+   +---+   +---+   +---+ 
"  ||F1|| ||F2|| ||F3|| ||F4|| | ||F5|| ||F6|| ||F7|| ||F8|| | ||F11|| ||F12|| ||F13|| ||F14||
"  |/__\| |/__\| |/__\| |/__\| | |/__\| |/__\| |/__\| |/__\| | |/___\| |/___\| |/___\| |/___\|
"  .                         . | .                         . | .                             .
"  '^=====[ Vim Global]=====^' | '^=[ Environment Local ]=^' | '^===[ Desktop Universal ]===^'
"                              |                             |
"
"  F1: Help(vim help)               C-F1:
"  F2: FileExplorer(NerdTreeToggle) C-F2:
"  F3: Outlines(TargbarToggle)      C-F3:
"  F4:                              C-F4:
"
"  F5: Help(vim help)
"  F7: FileExplorer(NerdTreeToggle)
"  F8: Outlines(TargbarToggle)
"  F9: 
"
"  F5: Help(vim help)
"  F7: FileExplorer(NerdTreeToggle)
"  F8: Outlines(TargbarToggle)
"  F9: 
"
"  +-----+----------------------------+--------------------------------------+
"  |     | F5                         | F6                                   |
"  +-----+----------------------------+--------------------------------------+
"  |     | Compile Only               | Debug Compiled                       |
"  | Ctrl| Recompile and Run in Gvim  | Debug Compiled And Debug in Gvim     |
"  | Alt | Recompile and Open Terminal| Debug Compiled And Debug in Terminal |
"  +-----+----------------------------+--------------------------------------+
"  |     | F7                         | F8                                   |
"  +-----+----------------------------+--------------------------------------+
"  |     | Check Codes                | Synchronized to Version Control      |
"  +-----+----------------------------+--------------------------------------+
"  | Ctrl|                            |                                      |
"  | Alt |                            |                                      |
"  +-----+----------------------------+--------------------------------------+
" ******************************************************************






set autowrite

if !(GetOSType()=='win') 
    setlocal makeprg=g++\ -O2\ -std=c++11\ -lm\ -o\ %<\ %
endif


noremap  <F5> <Esc>:make<CR>
noremap! <F5> <Esc>:make<CR>

noremap  <C-F5> <Esc>:make<Bar>!./%<CR>
noremap! <C-F5> <Esc>:make<Bar>!./%<CR>

noremap  <A-F5> <Esc>:make<Bar>!/usr/bin/gnome-terminal --geometry=120x42+500+220<CR>
noremap! <A-F5> <Esc>:make<Bar>!/usr/bin/gnome-terminal --geometry=120x42+500+220<CR>




" TODO: detect if ycm installed
let g:ycm_global_ycm_extra_conf='$MYVIMFTH/ycm_extra_conf_4cpp.py'


" Note: if need c-c & c-v :se nocin first.
" vim:noeol:cin:sr:et:ts=4:sts=4:tw=98:ft=vim:ff=unix:fenc=utf-8:
" EOF
