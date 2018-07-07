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
"  +-------+----------------------------+--------------------------------------+
"  |       | F5                         | F6                                   |
"  +-------+----------------------------+--------------------------------------+
"  |       | Compile Only               | Debug Compiled                       |
"  | Ctrl  | Recompile and Run in Gvim  | Debug Compiled And Debug in Gvim     |
"  | Shift | Recompile and Open Terminal| Debug Compiled And Debug in Terminal |
"  +-------+----------------------------+--------------------------------------+
"  |       | F7                         | F8                                   |
"  +-------+----------------------------+--------------------------------------+
"  |       | Check Codes                | Synchronized to Version Control      |
"  +-------+----------------------------+--------------------------------------+
"  | Ctrl  |                            |                                      |
"  | Alt   |                            |                                      |
"  +-------+----------------------------+--------------------------------------+
"  Note: There are some problems about meta alt key mapping
"
"   *   Alt can only pair with ascii alphabates, but can not pair with Function Keys. e.g.
"       `Alt + q`  : YES is OK can work 
"       `Alt + F5` : NO  invalid can not work !!!
"   *   use `:w | e` to refresh edit window
" ******************************************************************






set autowrite

if !(GetOSType()=='win') 
    setlocal makeprg=g++\ -O2\ -std=c++11\ -lm\ -o\ %<\ %
endif

" Normal / Distribution Compilation
noremap  <F5> <Esc>:make<CR>
noremap! <F5> <Esc>:make<CR>

noremap  <C-F5> <Esc>:make<Bar>!./%<<CR>
noremap! <C-F5> <Esc>:make<Bar>!./%<<CR>

" use cmd: ./% < some.in.rc
noremap  <S-F5> <Esc>:make <Bar> !gnome-terminal --geometry=160x48+300+300<CR>
noremap! <S-F5> <Esc>:make <Bar> !gnome-terminal --geometry=160x48+300+300<CR>

" Debug Compliation
noremap  <F6>   <Esc>:!g++ -g -std=c++11 -lm -o %< %<CR>
noremap! <F6>   <Esc>:!g++ -g -std=c++11 -lm -o %< %<CR>

noremap  <C-F6> <Esc>:!g++ -g -std=c++11 -lm -o %< % | gdb %< <CR>
noremap! <C-F6> <Esc>:!g++ -g -std=c++11 -lm -o %< % | gdb %< <CR>


" use gdb -tui to debug
noremap  <S-F6> <Esc>:!g++ -g -std=c++11 -lm -o %< % <Bar> !gnome-terminal --geometry=160x48+300+300<CR>
noremap! <S-F6> <Esc>:!g++ -g -std=c++11 -lm -o %< % <Bar> !gnome-terminal --geometry=160x48+300+300<CR>

silent function! DebugCompliation()
endfunction






" TODO: detect if ycm installed
let g:ycm_global_ycm_extra_conf='$MYVIMFTH/ycm_extra_conf_4cpp.py'

let NERDTreeIgnore = ['\.o$[[file]]'] 
let NERDTreeSortOrder=['\.cpp$']

" Note: if need c-c & c-v :se nocin first.
" vim:noeol:cin:sr:et:ts=4:sts=4:tw=98:ft=vim:ff=unix:fenc=utf-8:
" EOF
