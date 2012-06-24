
set guioptions-=T                      " hide toolbar
set guioptions-=r                      " hide right-hand scrollbar
set guioptions-=l                      " hide left-hand scrollbar
set guioptions-=L                      " hide left-hand scrollbar while there is vertically split window
set guioptions-=m                      " hide menubar



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
