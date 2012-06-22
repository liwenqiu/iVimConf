
" do not compatible with legacy vi
set nocompatible

call pathogen#infect()

" highlight program grammar
syntax enable

set background=dark
colorscheme solarized

" do not flash cursor
set gcr=a:block-blinkon0

" encoding (abbr=>enc), used to display file content
set enc=utf-8
" fileencoding (abbr=fenc), the actual encoding of current file
set fenc=utf-8
" fileencodings (abbr=>fencs), used to parses the inputted file
" vim will convert to encoding of specified on 'enc'
set fencs=utf-8


set backspace=indent,eol,start

" auto wrap to next line, opposite: nowrap
set wrap

" whitespace
" dont't wrap lines
set nowrap
" a tab is four space          
set tabstop=4 shiftwidth=4 
" backspace through everything in insert mode     
set backspace=indent,eol,start  
" use space, not table, opposite: set noexpandtab, opposite: set noexandtab
set expandtab              



set listchars=tab:▸\ ,eol:¬  " display tab char as '▸', and line trail as '¬'
set list                     " display special char as listchars definition, opposite: set list!


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

" alway display status bar
set laststatus=2

" ===== Key mapping =====

nmap <c-h> <c-w>h  " switch focus on windows
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

"nmap <c-]> <c-w>+  " resize window
"nmap <c-[> <c-w>-

imap <c-h> <left>   " move cursor in insert mode
imap <c-l> <right>
imap <c-j> <down>
imap <c-k> <up>


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
