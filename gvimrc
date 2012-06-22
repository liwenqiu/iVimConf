
" 
" Generic gui settings
"
if has("gui")

" hide toolbar
set guioptions-=T
" hide right-hand scrollbar
set guioptions-=r
" hide left-hand scrollbar
set guioptions-=l
" hide left-hand scrollbar when there is vertically splite window
set guioptions-=L

endif

"
" MacVim gui settings
if has("gui_macvim")

" unbind mac menu key
macmenu &File.Print key=<nop>
macmenu &File.New\ Tab key=<nop>
macmenu &Tools.Make key=<nop>

" bind short-key for Command-T
nmap <D-t> :CommandT<cr>
nmap <D-b> :CommandTBuffer<cr>

" bind short-key for nerdtree
nmap <D-e> :NERDTreeToggle<cr>

endif