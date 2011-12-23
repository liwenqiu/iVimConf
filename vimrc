
" ===== Basic settings =====

set nocompatible  " no compatible with legacy vi

syntax enable  " highlight program grammar

set background=dark    " colorscheme
colorscheme solarized

set gcr=a:block-blinkon0  " do not flash cursor

set enc=utf-8  " encoding (abbr=>enc), used to display file content
set fenc=utf-8  " fileencoding (abbr=>fenc), the actual encoding of current file
set fencs=utf-8  " fileencodings (abbr=>fencs), used to parses the inputted file, vim will convert to encoding of 'enc' specified

set nu!
set laststatus=2
set statusline=%F%m%=[ASCII=%b][HEX=%B][POS=%l,%v,%p%%][LEN=%L]

set hidden  " allow siwtch unsaved buffer

set wmh=0  " winminheight (abbr=>wmh), the minimal height of a window
set wmw=0  " winminwidth (abbr=>wmw), the minimal width of a window

set backspace=indent,eol,start

set listchars=tab:▸\ ,eol:¬  " display tab char as '▸', and line trail as '¬'
set list                     " display special char as listchars definition, opposite: set list!

" whitespace
set nowrap                      " dont't wrap lines
set tabstop=4 shiftwidth=4      " a tab is four space
set backspace=indent,eol,start  " backspace through everything in insert mode
set expandtab                   " use space, not table, opposite: set noexpandtab, opposite: set noexandtab


" searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive
set smartcase   " ... unless they contain at least one capital letter

set noerrorbells  " disable alter sounds when encountered error
set novisualbell
set vb t_vb=

set autoindent  " auto indent as the indent of previous line, opposite: noautoindent
set cindent  " indent like C programming language, opposite: nocindent


" ===== Key mapping =====

nmap <c-h> <c-w>h  " switch focus on windows
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

nmap <c-=> <c-w>+  " resize window
nmap <c--> <c-w>-

imap <c-h> <left>   " move cursor in insert mode
imap <c-l> <right>
imap <c-j> <down>
imap <c-k> <up>



" ===== NERDTree plugin settings =====

autocmd WinEnter * call s:CloseIfOnlyNERDTreeLeft()
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNERDTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction


" ===== BufExplorer plugin settings =====
let g:bufExplorerDefaultHelp=0  " Do not show default help


" ===== Taglist plugin settings =====
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1  " opposite: TList_Use_Left_Window



