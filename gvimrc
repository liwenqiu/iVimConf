
" ===== GUI related settings =====
if has("gui")

" UI related
set guioptions-=T  " hide toolbar
set guioptions-=r  " hide right-hand scrollbar
set guioptions-=l  " hide left-hand scrollbal
set guioptions-=L  " hide left-hand scrollbar when there is vertically splite window


endif " has("gui")

" MacVim 
if has("gui_macvim")

" unbind mac menu key
macmenu &File.Print key=<Nop>
macmenu &File.New\ Tab key=<Nop>
macmenu &Tools.Make key=<Nop>


" set macmeta=1
let macvim_skip_cmd_opt_movement=1
let macvim_hig_shift_movement=1


nmap <D-e> :NERDTreeToggle<cr>
nmap <D-b> :BufExplorer<cr>

" create new window
nmap <D-t> :new<cr>

" resime window size
nmap <D-Up> <c-w>+
nmap <D-Down> <c-w>-

endif


