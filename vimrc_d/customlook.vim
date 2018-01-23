" Custom The Vim Look
" ===================
" 
" Both on workstation or servers, both on terminal or guis.
"
" Interface
" ---------  
" * IMPORT 
" 	  + platform.vim / 
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
" 1. Custom User Interface
" 2. Detect System Archityre
" 3. Detect NeoVim
" 4. Detect OS Type
"
" (EOC)

" functions
"
function! s:SetGUITheme(ost) abort
    " overrides colo if need	
	colorscheme base16-eighties
	if a:ost == "linux"
		set guifont=Terminess\ Powerline\ 12
	elseif a:ost == "win"
		set guifont=MesloLGS_NF:h9:cANSI:qDRAFT
	elseif a:ost == "mac"
		set guifont=MesloLGS_NF:h11
	elseif a:ost == "msys"
		set guifont=Terminus\ 12
	else
		echom '[-] unsupported os type, can not find right gui-opt'
	endif
endfunction

function! s:SetConTheme(ost) abort
    " overrides colo if need	
	colorscheme base16-eighties
	if a:ost == "linux"
		set t_Co=256
		colorscheme base16-eighties
	elseif a:ost == "win"
		set t_Co=256
		colorscheme industry
		set guifont=Bitstream_Vera_Sans_Mono:h10.5
	elseif a:ost == "mac"
		set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h11
	elseif a:ost == "msys"
		" nothing can do now
	else
		echom '[-] unsupported os type, can not find right con-opt'
	endif
endfunction

function! s:SetFileFormat(ost) abort
	" use unix most
	set fileformat=unix
	if a:ost == 'linux'
		set fileformats=unix,mac,dos
	elseif (a:ost == 'win') || ( a:ost == 'msys')
		set fileformats=dos,unix,mac
	elseif a:ost == 'mac'
		set fileformats=mac,dos,unix
	else
		echom '[-] unsupported os type, can not find right file-opt'
    endif
endfunction














" basic theme
let base16colorspace=256
set background=dark

" window componets
set number
set ruler
set laststatus=2        " always display statusline like airline
set cmdheight=1
set colorcolumn=100
set cursorline
hi CursorLine term=underline cterm=underline guibg=#202020
hi CursorLine ctermbg=darkgrey guibg=gray13
set shortmess=at

if IsGUI()
	" au GUIEnter * simalt ~x
	winpos 420 200
	set columns=200
	set lines=60
	set guioptions-=m  " use :se go+=m to recall menu
	set guioptions-=T
	set guioptions-=r
	set guioptions-=L
	call s:SetGUITheme(GetOSType())
else
	call s:SetConTheme(GetOSType())
endif

" tabs and indent 
set cindent   " overrides ai si
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" Except for Makefiles; hard tabs of width 2
"au FileType make set ts=2
" And Markdown


" text wrapping 
set writebackup
set nobackup
set noswapfile          " use version control insead
set clipboard=unnamed   " use OS clipboard ro copypasta
set paste               " fix bad autoindent of pasted text
if has("mouse")         " Enable OS mouse clicking and scrolling
    set mouse=a
endif
set autoread
set autochdir

" code folding
set foldenable
set foldmethod=indent    "/marker/syntax"
set foldcolumn=1
set foldlevelstart=20
let javaScript_fold=1                 " JavaScript
let perl_fold=1                       " Perl
let php_folding=1                     " PHP
let r_syntax_folding=1                " R
let ruby_fold=1                       " Ruby
let sh_fold_enabled=1                 " sh
let vimsyn_folding='af'               " Vim script
let xml_syntax_folding=1              " XML
" use SPACE to unfold code, zR: open all folds zM: close all folds
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" search options 
set showmatch
set incsearch
set ignorecase
set smartcase
set hlsearch










set lazyredraw       " Fix the problems for scrolling slowly
set modifiable       " Fix E21: in NerdTree
" }


" + 3.4. File Options {
" ---------------------
syntax on
filetype plugin indent on
if has("multi_byte")
	set encoding=utf-8
endif
"set fileencoding=utf-8
"set termencoding=utf-8
let &termencoding=&encoding
set fileencodings=utf-8,cp936,default,latin-1,GB232,GBK,GB8030,ucs-bom
set formatoptions=croql
set backspace=indent,eol,start
call s:SetFileFormat(GetOSType())



" } 



"    augroup VCenterCursor
"        au!
"        au BufEnter,WinEnter,WinNew,VimResized *,*.*
"                    \ let &scrolloff=winheight(win_getid())/2
"    augroup END
"
"    function WindowCenterInScreen()
"        set lines=9999 columns=9999
"        let g:windowsSizeFixX = 58
"        let g:windowsSizeFixY = 118
"        let g:windowsScaleX   = 7.75
"        let g:windowsScaleY   = 17.0
"        let g:windowsPosOldX = getwinposx()
"        let g:windowsPosOldY = getwinposy()
"        let g:windowsScreenWidth  = float2nr(winwidth(0) * g:windowsScaleX) + \
"                                    g:windowsPosOldX + g:windowsSizeFixX
"        let g:windowsScreenHeight = float2nr(winheight(0) * g:windowsScaleY) + \
"                                    g:windowsPosOldY + g:windowsSizeFixY
"        set lines=60 columns=200
"        let g:windowsSizeWidth = float2nr(winwidth(0) * g:windowsScaleX) + g:windowsSizeFixX
"        let g:windowsSizeHeight = float2nr(winheight(0) * g:windowsScaleY) + g:windowsSizeFixY
"        let g:windowsPosX = ((g:windowsScreenWidth - g:windowsSizeWidth) / 2)
"        let g:windowsPosY = ((g:windowsScreenHeight - g:windowsSizeHeight) / 2)
"        "exec ':winpos ' g:windowsPosX ' ' g:windowsPosY
"        exec ':winpos ' 200  ' ' 400
"    endfunc
"    "au GUIEnter * call WindowCenterInScreen()
"
"    "au! VCenterCursor
"    "au VimEnter * normal zz

" au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

" + 3.7. Disable Beeping {
" ------------------------
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
" }

