
" * vim-airline
" -------------
let g:airline_theme ='base16'   " 'powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:Powerline_symbols = 'fancy'
"set fillchars+=stl:\ ,stlnc:\
"set laststatus=2

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"nnoremap <C-P> :bp<CR>
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }


" Undotree: 
" ---------
if has("persistent_undo")
    set undodir=$HOME/.undo/
    set undofile
    nnoremap <S-F2> :UndotreeToggle<CR>
endif

" Tagbar:
" ------
nnoremap <F3> :TagbarToggle<CR>
inoremap <F3> <Esc>:w<Bar>TagbarToggle<CR>


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
    if GetOSType() == "win"
        set statusline+=%{SyntasticStatuslineFlag()}
    endif
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    if GetOSType() == "win"
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






" jszakmeister/markdown2ctags
" ---------------------------
"  belongs to UI componet & markdown
"
"let g:tagbar_type_markdown = {
"    \ 'ctagstype': 'markdown',
"    \ 'ctagsbin' : s:bundled.'markdown2ctags/markdown2ctags.py',
"    \ 'ctagsargs' : '-f - --sort=yes',
"    \ 'kinds' : [
"        \ 's:sections',
"        \ 'i:images'
"    \ ],
"    \ 'sro' : '|',
"    \ 'kind2scope' : {
"        \ 's' : 'section',
"    \ },
"    \ 'sort': 0,
"\ }





" + 3.9. Make And Build {
" -----------------------
    if GetOSType() == "win"
     "   autocmd FileType markdown setlocal makeprg=start "$ProgramFiles/Typora/Typora.exe"\ %
        autocmd FileType markdown nmap <leader>mk :!start "C:/Program Files/Typora/Typora.exe"\ %<cr>
    endif
" }



" + vim-emoji
" -----------

" for e in emoji#list()
"   call append(line('$'), printf('%s (%s)', emoji#for(e), e))
" endfor
" set completefunc=emoji#complete



" + 4.2. plugins.yggdroot/indentline {
" ------------------------------------
    nmap <LocalLeader>il :IndentLinesToggle<CR>
    let g:indentLine_enabled=1
    "let g:indentLine_char = '┊'
    if IsGUI()
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
   " if g:isWindows
   "     let g:NERDTreeCopyCmd = 'copy '
   " else
   "     let g:NERDTreeCopyCmd = 'cp -r'
   " endif
    let g:NERDTreeMouseMode = 2
    let g:NERDTreeWinSize   = 40
    let g:NERDTreeMinimalUI = 1
    let g:NERDTreeIgnore    = ['\*NTUSER*','\*ntuser*','\NTUSER.DAT','\ntuser.ini']

    nmap <F2> :NERDTreeToggle .<CR>
" }



" + 4.12. plugins.Valloric/YouCompleteMe {
" ----------------------------------------
"
"   After vim-plug first install this plugin, you need to update submodules and install 
"   required components, if you want to execute ./install.py --all satisfactorily. Of cause,
"   different OS platform use different package manager. example commands may be bellow:
" 
"   ```sh
"     cd ~/.vim/plugged/YouCompleteMe
"     git submodule update --init --recursive
"
"     sudo dnf install -y \
"     automake gcc gcc-c++ kernel-devel cmake \
"     python-devel python3-devel nodejs nodejs-devel \
"     go rust cargo cargo-devel mono-devel
"
"     sudo apt-get install -y \
"     golang cargo mono-devel
"   ```

    let g:ycm_complete_in_comments = 1
    let g:ycm_complete_in_strings = 1
    let g:ycm_seed_identifiers_with_syntax = 1
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_key_list_select_completion = ['<tab>', '<c-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
    let g:ycm_confirm_extra_conf = 0
    if GetOSType() == "win"
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

" + 4.4. plugins.derekmcloughlin/gvimfullscreen_win32 {
" -----------------------------------------------------
   " if g:isWindows && g:isGUI
   "     map <F11> <Esc>:call libcallnr('gvimfullscreen.dll',
   "             \ 'ToggleFullScreen', 0)<CR><C-L>
   " endif
" }

" + 4.5. plugins.mattn/vimtweak { 
" -------------------------------
    "if g:isWindows && g:isGUI
        "let g:alpha_value=242
        "call libcallnr("vimtweak.dll", "SetAlpha", 235)
        " call libcallnr("vimtweak64.dll", "EnableMaximize", 1)
        "call libcallnr("vimtweak.dll", "EnableCaption", 1)
        "call libcallnr("vimtweak.dll", "EnableTopMost", 0)

        "autocmd FocusGained * call libcallnr("vimtweak.dll", "SetAlpha", 235)
        "autocmd FocusGained * call libcallnr("vimtweak64.dll", "SetAlpha", 242)
        "autocmd FocusLost * call libcallnr("vimtweak64.dll", "SetAlpha", 166)
        
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
        "map <F10> <Esc>:call libcallnr('vimtweak64.dll', 'SetAlpha', 200)<CR>
        ""map <F10> <Esc>:call TweakWindowAlphaM(10,1)<CR>
        "map <S-F10> <Esc>:call libcallnr('vimtweak64.dll', 'SetAlpha', 242)<CR>
        "map <S-F10> <Esc>:call TweakWindowAlphaM(10, 0)<CR>
		"map <C-S-F10> <Esc>:call libcallnr('vimtweak64.dll', 'SetAlpha', 255)<CR>
    "endif
" }





" + 4.8. plugins.maksimr/vim-jsbeautify {
" ---------------------------------------
  "  if (g:isWindows || g:isMsys)
  "      let g:editorconfig_Beautifier=expand('$HOME/vimfiles/.editorconfig')
  "  elseif (g:isMac || g:isLinux)
  "      let g:editorconfig_Beautifier=expand('$HOME/.vim/.editorconfig')
  "  else
  "      let g:editorconfig_Beautifier=expand('$HOME/.vim/.editorconfig')
  "  endif
" }

