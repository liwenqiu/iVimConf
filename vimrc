
" UI
color desert
set nu!
set laststatus=2
set statusline=%F%m%=[ASCII=%b][HEX=%B][POS=%l,%v,%p%%][LEN=%L]


" Whitespace
set nowrap                      " dont't wrap lines
set tabstop=4 shiftwidth=4      " a tab is four space
set backspace=indent,eol,start  " backspace through everything in insert mode
set expandtab                   " use space, not table, opposite : set noexpandtab


" searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive
set smartcase   " ... unless they contain at least one capital letter


set nocompatible  " no compatible with legacy vi

set autoindent
set cindent


" NERDTree plugin settings
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


nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

" BufExplorer plugin settings
let g:bufExplorerDefaultHelp=0  " Do not show default help

" Taglist plugin settings
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1  " TList_Use_Left_Window

