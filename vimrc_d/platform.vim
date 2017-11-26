" * **0x01. Global Variable Definitions.**
" ========================================
"
" Detect OS type, GUI environment and set the base variables, this vim resource file
" support platform can be described bellow. For practical reason, currently, servircommon platform:
"
" +-----------+-----------+------------+------------+---------+
" |           | isWindows | isMsys     | isMac      | isLinux |
"           
" +-----------+-----------+------------+------------+---------+
" | isGUI     |   usual   |  ---       | occasional |  usual  |
" +-----------+-----------+------------+------------+---------+
" | isConsole |   rare    | occasional | usual      |  hot    |
" +-----------+-----------+------------+------------+---------+
"     _tab1-1:supported platforms_
" "
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



" vim:nocp:cin:sr:et:ts=4:sts=4:ft=vim:ff=unix:fenc=utf-8:
" EOF
