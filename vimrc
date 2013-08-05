
" liwenqiu
" http://liwenqiu.me
" liwenqiu@gmail.com

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

set nolist

set hidden

set linespace=0

set nofoldenable

set number

set numberwidth=4

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


" always open vertical split window in the right side
set splitright
" always open horizontal splite window below
set splitbelow

" start scrolling when n lines away from margins
set scrolloff=5
set switchbuf=useopen

" syntax highlight
syntax on


" search highlight
set hlsearch
" incremental search
set incsearch


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


