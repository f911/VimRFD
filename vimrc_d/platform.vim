" 0x01. Global Variable Definitions.
" ========================================
"
" More documents please check ~/.vim/docs/docs/platform.md
" 
" all list in popular order for performance concern
" we just supply possible you pick choice as need.
" use `:message` to debug by checking g:isXXX value
"
" Interface
" ---------  
" * extern: None
" * export: g:isGUI, g:isX64, g:isWindows, g:isMsys, g:isMac, g:isLinux
"           IsGUI
"            GetOSType()
"
" Procedure
" ---------
" 1. Detect GUI
" 2. Detect System Archityre
" 3. Detect OS Types
"
" (EOC)



" Detect GUI
" ----------
let s:f_gui = ["gui", "gui_running", "gui_win32", "gui_gtk", "gui_mac",
          \  "gui_athena", "gui_gnome", "gui_gtk2", "gui_gtk3", 
          \  "gui_motif", "gui_photon", "gui_win32s" ]
let g:isGUI = 0
for s:fg in s:f_gui
    if has(s:fg)
        let g:isGUI = 1
        break
    endif
endfor
echom "g:isGUI = ".g:isGUI

" Detect Architure
let g:isX64 = 0
if has("num64")
    let g:isX64 = 1
endif
echom "g:isX64 = ".g:isX64



" Detect OS types
" ---------------
" Items can be added later when needed.
"
" * Windows 
"   in vim windows means a function, and use win to point Microsoft Windows
let g:isWindows = 0
let s:f_os_win = ["win32", "win32unix", "win64", "win95"]
for s:fow in s:f_os_win
    if has(s:fow)
        let g:isWindows = 1
        break
    endif
endfor
echom "g:isWindows = ".g:isWindows

" * Msys
let g:isMsys = 0
if (has("win32unix") && $OS=="Windows_NT")
    let g:isMsys = 1
endif
echom "g:isMsys = ".g:isMsys

" * Linux
let g:isLinux = 0
if (has("unix"))
    let g:isLinux = 1
endif
echom "g:isLinux = ".g:isLinux

" * unknown

 "function! 
 "return l:os_type

" vim:nocp:cin:sr:et:ts=4:sts=4:tw=98:ft=vim:ff=unix:fenc=utf-8:
" EOF
