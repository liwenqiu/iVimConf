" focus on switched between splited windows
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" split window resize
if bufwinnr(1)
"  map <C-W>0 :resize +10<CR>
"  map <C-W>9 :resize -10<CR>
"  map <C-W>. :vertical resize +30<CR>
"  map <C-W>, :vertical resize -30<CR>
  nmap <silent><leader>0 :resize +10<cr>
  nmap <silent><leader>9 :resize -10<cr>
  nmap <silent><LEADER>= :vertical resize +10<CR>
  nmap <silent><LEADER>- :vertical resize -10<CR>
endif

" make the current window bigger
"set winwidth=84
"set winheight=5
"set winminheight=5
"set winheight=999

" select all content
nmap <c-a> <esc>ggVG

" move cursor in insert mode
imap <c-h> <left>
imap <c-l> <right>
imap <c-j> <down>
imap <c-k> <up>


