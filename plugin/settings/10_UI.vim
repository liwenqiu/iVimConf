" =====================================
" Generic UI Setting
" =====================================
if has("gui")

" customize UI component
set guioptions-=T                      " hide toolbar
set guioptions-=r                      " hide right-hand scrollbar
set guioptions-=l                      " hide left-hand scrollbar
set guioptions-=L                      " hide left-hand scrollbar while there is vertically split window
set guioptions-=m                      " hide menubar

" set color scheme
set background=dark
colorscheme solarized

endif

if has("gui_macvim")

set guifont=Source\ Code\ Pro\ for\ Powerline:h12
"set guifont=Monaco\ for\ Powerline:h11

endif


if has("gui_win32")

"set guifont=DejaVu\ Sans\ Mono:h10
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10

language messages zh_CN.UTF-8

endif

" =====================================
" Powerline Setting
" =====================================
let g:Powerline_symbols='fancy'
