
" =====================================
" Generic Short-Key Binding
" =====================================

" focus on switched between splited windows
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" split window resize
if bufwinnr(1)
  nmap <silent><leader>0 :resize +10<cr>
  nmap <silent><leader>9 :resize -10<cr>
  nmap <silent><LEADER>= :vertical resize +10<CR>
  nmap <silent><LEADER>- :vertical resize -10<CR>
endif

" select all content
nmap <c-a> <esc>ggVG

" move cursor in insert mode
imap <c-h> <left>
imap <c-l> <right>
imap <c-j> <down>
imap <c-k> <up>

" open directory of current opened file
map <leader>r :NERDTreeFind<cr>


" =====================================
" MacVim Short-Key Binding
" =====================================
if has("gui_macvim")

  " unbind macvim menu key binding
  macmenu &File.New\ Tab key=<nop>
  macmenu &File.Print key=<nop>

  macmenu &Tools.Make key=<nop>

  " short-key binding

  nmap <d-e> :NERDTreeToggle<cr>

  nmap <d-t> :CommandT<cr>
  nmap <d-b> :CommandTBuffer<cr>

endif


