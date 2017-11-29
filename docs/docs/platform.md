**platform.vim**: Detect the 'OS Contexts'
==========================================

![Vim|RFD][01] / ![doc|VimRFD][02]
<!--![Markdown](https://upload.wikimedia.org/wikipedia/commons/4/48/Markdown-mark.svg)-->


> Detect OS type, GUI environment and set the base variables, <br/>
> This vim resource file support platform can be described bellow. <br />
> For practical reason, currently, servircommon platform: <br />




Former Used Design
------------------

 
|  ENVs     | isWindows | isMsys     | isMac      | isLinux |
|-----------|:---------:|:----------:|:----------:|:-------:|
| isGUI     |`usual`    |`None`      |`occasional`|`usual`  |
| isConsole |`rare`     |`occasional`|`usual`     |`hot`    |

» ⎋ _tab1-1: old supported platforms_



In former design, we generally focused on OS type, while there are more details need to concern 
later on down the road, let alone **flexiablity** and **extendibility**.



Later Considered Design 
-----------------------

to identify more and get it more clear. In the most customers and producers views, 
our platform can be described as below:


```text
  kinds of information need to collect   or                 combine them like this
              :                                                       :
   x lib:          OS type:                   +--------------------+-----+---------+-----+-----+
 +---------+     +----------+---------+       |       OS type      | GUI | Console | x32 | x64 | 
 | GUI     |     | Linux    | REHL    |       +----------+---------+-----+---------+-----+-----+
 +---------+  X  |          | Fedora  |       | Linux    | REHL    |     |         |     |     | 
 | Console |     |          | Debian  |       |          | Fedora  |     |         |     |     |
 +---------+     |          | FreeBSD |       |          | Debian  |     |         |     |     |
                 |          | others  |       |          | FreeBSD |     |         |     |     |
  achitech:      +----------+---------+  =>   |          | others  |     |         |     |     |
 +---------+     | Windows  | WinNT   |       +----------+---------+-----+---------+-----+-----+
 |   x32   |     |          | Msys    |       | Windows  | WinNT   |     |         |     |     |
 |---------+  X  +----------+---------+       |          | Msys    |     |         |     |     |
 |   x64   |     | Mac OS X | Darwin  |       +----------+---------+-----+---------+-----+-----+
 +---------+     +----------+---------+       | Mac OS X | Darwin  |     |         |     |     |
                 |  others  | beos    |       +----------+---------+-----+---------+-----+-----+
                 |          | qnx     |       | Others   |         |     |         |     |     | 
                 |          | ...     |       +----------+---------+-----+---------+-----+-----+
                 +----------+---------+       | Unknown  |                                     | 
                                              +----------+-------------------------------------+
``` 
» _tab1-2 : new supported OS contexts_ 

see the possable context above, so **various** ...




Now Practical Design
-------------------

use 2-D tables to describe our `platform` circumstances.

```text

                 →             →            →            ∞
     os type:          x lib:        arch:      neovim
   +-------------+   +---------+   +------+   +----------+
   | Msys        | χ | GUI     | χ | x64  | χ | NeoVim   |
   | Windows     |   +---------+   +------+   +----------+
   | Mac OS X    |   | Console |   | x32  |   | Original |
   | Linux       |   +---------+   +------+   +----------+
 ↓ | unsupported |  
   +-------------+  
 ↓ | ( can be    |
   |   extended  |  
 ↓ |   later )   |
   | ... ...     |  
 ∞ +-------------+   
                      
```





Discipline
----------

* Most of the time, there is a gap between 'industrial' and 'customer', exp. HP or Ange OS we 
  use rarely. So we need this module make our vim **Refined**. 

* Different plugins need different information, other kinds of information would not be concern 
  there, as they are rarely used, and can be gain by plugin itself, or write codes for that
  condition separely.


  environments like `tmux` would not place here, as more and more software will have influence
  on vim, we need handle it conditionally. On the other hand, OS type is stable and 
  vim-features as well.




[function!](https://www.ibm.com/developerworks/library/l-vim-script-2/index.html)
> Redeclarable functions
> Function declarations in Vimscript are runtime statements, so if a script is loaded twice, 
> any function declarations in that script will be executed twice, re-creating the corresponding 
> functions. 
> Redeclaring a function is treated as a fatal error (to prevent collisions where two separate
> scripts accidentally declare functions of the same name). This makes it difficult to create
> functions in scripts that are designed to be loaded repeatedly, such as custom
> syntax-highlighting scripts. So Vimscript provides a keyword modifier (function!) that allows
> you to indicate that a function declaration may be safely reloaded as often as required:
> 


Source Code
-----------





```vim

" * **0x01. Global Variable Definitions.**
" ========================================
"
" More documents please check ~/.vim/docs/docs/platform.md
" 
" all list in popular order for performance concern
" we just supply possible you pick choice as need.
" use `:message` to debug by checking g:isXXX value


" Detect GUI
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
" * Windows 
"   in vim windows means a function, and use win to point Microsoft Windows
let s:f_os_win = ["win32", "win32unix", "win64", "win95"]
for s:fow in s:f_os_win
    if has(s:fow)
        let g:isWindows = 1
        break
    endif
endfor
echom "g:isWin = ".g:isWindows

" * Msys
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

" vim:nocp:cin:sr:et:ts=4:sts=4:tw=98:ft=vim:ff=unix:fenc=utf-8:
" EOF




```


[01]: https://img.shields.io/badge/Vim-RFD-4166FF.svg?style=flat
[02]: https://img.shields.io/badge/doc-VimRFD-0DA664.svg?style=flat

<!--
vim:nocp:cin:sr:et:ts=4:sts=4:sw=4:ft=markdown.pandoc:ff=unix:fenc=utf-8:
EOF
-->
