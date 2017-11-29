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
" * IMPORT 
"      None
" * EXPORT: 
"    + IsGUI() : bool
"    + Is64Bit() : bool
"    + IsNeoVim() : bool
"    + GetOSType(): str
"    + TODO: GetOSVersion(): str, or maybe needless
" * FUNCTION:
"    + the layer below application,
"    + after so $MYVIMRC before all other VimRFD moduals.
"
" Procedure
" ---------
" 1. Detect GUI
" 2. Detect System Archityre
" 3. Detect NeoVim
" 4. Detect OS Type
"
" (EOC)



" Detect GUI
silent function! IsGUI()
    let l:isGUI = 0
    let l:f_gui = ["gui", "gui_running", "gui_win32", "gui_gtk", "gui_mac",
                \  "gui_athena", "gui_gnome", "gui_gtk2", "gui_gtk3", 
                \  "gui_motif", "gui_photon", "gui_win32s" ]
    for l:fg in l:f_gui
        if has(l:fg)
            let l:isGUI = 1
            break
        endif
    endfor
    return l:isGUI
endfunction

" Detect Architure
silent function! Is64Bit()
    return has("num64")
endfunction

" Detect NeoVim
silent function! IsNeoVim()
    return has("nvim")
endfunction


" Detect OS Types
" + Items can be added later when needed. 
" + Concern some overlap kinds like windows vs. msys / mac vs. unix
" + Using a judge order to try to get more epecific and identical os type.
" + In this version, the return os-type-name can be:
"   msys | win | mac | linux
" + most feature items are found in  :help feature-list, some reference from
"   websites.
" + os type can be devide to 4 class, they are:
"   1. posix
"   2. windows
"   3. others 
"   4. unknown
"   or we need more specific.
"
" + algorithm: 
"   first test all, then filter the positive, use the tested result to feed up cods, after
"   that more precise, but little smart.
"   filter save me a lot. 
silent function! GetOSType()
    let l:osfall = [ "win16", "win32", "win32unix", "win64", "win95",
                  \   "unix", "mac", "macunix", "osx",  
                  \   "aimiga","beos","os2", "qnx", "vms"] 
    let l:osfhas = filter(l:osfall, 'has(v:val)') 
    
    if empty(l:osfhas)
        return "unknown"
    elseif count(l:osfhas, "win32unix")
        return "msys"
    elseif match(join(l:osfhas, "_"), "win") != -1
        return "win"
    elseif match(join(l:osfhas, "_"), "mac") != -1
        return "mac"
    elseif match(join(l:osfhas, "_"), "unix") != -1
        return "linux"
    else
        return "unsupport"
    endif 
    " DEBUG:
    "echom string(l:osfhas)
endfunction




" vim:nocp:cin:sr:et:ts=4:sts=4:tw=98:ft=vim:ff=unix:fenc=utf-8:
" EOF
