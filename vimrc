
" liwenqiu
" http://liwenqiu.me
" liwenqiu@gmail.com

" ### Generic Setting ###

" not compatible with the old-fashion vi mode
set nocompatible

" allow backspacing over everything in insert nc > kkmode
set backspace=2

" keep 500 lines of command line history
set history=500
set undolevels=50

" show the cursor position all the time
set ruler

" auto read when file is changed from outside
set autoread

" auto wrap large text to next line
set wrap
set linebreak

" disable backup
set nobackup
set noswapfile

set nolist

" a buffer becomes hidden when it is abandoned
set hidden

set linespace=0

set nofoldenable

set number

set numberwidth=4

" change the terminal's title
set title

set showmode

" no BOM (Byte Order Mark)
set nobomb

set nostartofline

set laststatus=2

set clipboard+=unnamed

" disable cursor flash
set gcr=a:block-blinkon0

" disable sound on error occurred
set novisualbell
set noerrorbells
set t_vb=
set tm=500

" <TAB> width
set tabstop=4
" number of spaces to use for autoindenting
set shiftwidth=4
set softtabstop=4
" insert tabls on the start of a line according to shiftwidth, not tabstop
set smarttab
" replace <TAB> with spaces
set expandtab

" file encoding
set encoding=utf-8
set fileencoding=utf-8 enc=utf-8 tenc=utf-8
set fileencodings=utf-8,chinese,ucs-bom,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1,euc-jp,utf-16le,latin1
scriptencoding utf-8

" always open vertical split window in the right side
set splitright
" always open horizontal splite window below
set splitbelow

" start scrolling when n lines away from margins
set scrolloff=5
set switchbuf=useopen

set cursorcolumn
set cursorline

" show the match brackets
set showmatch
" how many tenths of a second to blink when match brackets
set mat=2

" syntax highlight
syntax on


" search highlight
set hlsearch
" incremental search
set incsearch


" ### Hot Key ###

let mapleader=','
let g:mapleader=','

" smart way to move between splited window
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" split window resize
if bufwinnr(1)
    nmap <silent><leader>0 :resize +10<cr>
    nmap <silent><leader>9 :resize -10<cr>
    nmap <silent><leader>= :vertical resize +10<cr>
    nmap <silent><leader>- :vertical resize -10<cr>
endif

" select all content
if has("gui_macvim")
    nmap <d-a> <esc>ggVG
endif

" move cursor in insert mode
imap <c-h> <left>
imap <c-l> <right>
imap <c-j> <down>
imap <c-k> <up>

" go to home and end using capitalized directions
noremap H 0
noremap L $

" remap VIM 0 to first non-blank character
"map 0 ^

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" ### nerdtree ###

Bundle 'scrooloose/nerdtree'

if has("gui_macvim")
  nmap <d-e> :NERDTreeToggle<cr>
endif

let NERDTreeHighlightCursorline=1
let NERDTreeShowBookmarks=0
let NERDTreeChDirMode=2
let NERDTreeMouseMode=2
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_open_on_gui_startup=0
let g:NERDTreeWinSize=30

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" ### vim-colors-solarized ###

Bundle 'altercation/vim-colors-solarized'
colorscheme solarized
set background=dark
set t_Co=256


" ### vim-powerline ###

Bundle 'Lokaltog/vim-powerline'

let g:Powerline_symbols='fancy'
"let g:Powerline_symbols='unicode'


" ### ctrilp ###
Bundle 'kien/ctrlp.vim'
"let g:ctrlp_map='<leader>p'
"let g:ctrlp_cmd='CtrlP'
"map <leader>f :CtrlPMRU<cr>
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

if has("gui_macvim")
    nmap <d-b> :CtrlPBuffer<cr>
    nmap <d-t> :CtrlP<cr>
endif


" ### indentLine ###
Bundle 'Yggdroot/indentLine'
let g:indentLine_noConcealCursor=1
let g:indentLine_color_term=0
let g:indentLine_char='¦'

filetype plugin indent on

if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=l
    set guioptions-=L
    set showtabline=1
    set noimd
    set t_Co=256
endif

if has("gui_macvim")
    set guifont=Source\ Code\ Pro\ for\ Powerline:h12
endif


