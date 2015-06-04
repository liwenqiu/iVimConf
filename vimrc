"
" Modeline and Notes {
"
"   This is the personal .vimrc file of Venture Lee.
"
"   You can find me at http://liwenqiu.mc
"  }

" Environment {

    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return (has('win16') || has('win32') || has('win64'))
        endfunction
    " }

    " no compatible with the old-fashion vi mode
    set nocompatible
    if !WINDOWS()
        set shell=/bin/sh
    endif

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes syncronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
            set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }

    " no switch IM while in insert/search mode
    set iminsert=0
    set imsearch=-1
" }

" Use vimrc beform if available {
    if filereadable(expand("~/.vimrc.before"))
        source ~/.vimrc.before
    endif
" }

" Plugins {
    " no compatible with the old-fashion vi mode
    set nocompatible
    filetype off
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim

    call vundle#begin()
    " :PluginList          - list configured plugins
    " :PluginInstall(!)    - install (update) plugins
    " :PluginUpdate        - update plugins
    " :PluginSearch(!) foo - search (or refresh cache first) for foo
    " :PluginClean(!)      - confirm (or auto-approve) removal of unused plguins

    Plugin 'gmarik/Vundle.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'majutsushi/tagbar'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'spiiph/vim-space'
    "Plugin 'altercation/vim-colors-solarized'
    Plugin 'tomasr/molokai'
    "Plugin 'Lokaltog/vim-powerline'
    Plugin 'bling/vim-airline'
    Plugin 'kien/ctrlp.vim'
    Plugin 'Yggdroot/indentLine'
    Plugin 'terryma/vim-expand-region'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'fatih/vim-go'
    call vundle#end()
    filetype plugin indent on
" }

" Use bundles config {
    if filereadable(expand("~/.vimrc.bundles"))
        source ~/.vimrc.bundles
    endif
" }


" General {
    set background=dark         " Assume a dark background
    
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    if has('clipboard')         " When possible use + register for copy-paste
        if has('unnamedplus')
            set clipboard=unnamed,unnamedplus
        else                    " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    " Most prefer to automatically switch to the current file directory when
    " a new buffer is opened; to prevent this behavior, add the following to
    " your .vimrc.bundles.local file:
    "   let g:spf13_no_autochdir = 1
    if !exists('g:spf13_no_autochdir')
        autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
        " Always switch to the current file directory
    endif

    "set autowrite                       " Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    "set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving

    set autoread                        " automatically read while file is changed from outside

    " No annoying sound on errors
    set novisualbell                    " don't beep
    set noerrorbells                    " don't beep
    set vb t_vb=
    set tm=500

    set completeopt=longest,menu

    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    " Setting up the directories {
        set nobackup
        set noswapfile
        set noundofile
        "set backup                   " Backups are nice ...
        "if has('persistent_undo')
        "    set undofile                 " So is persistent undo ...
        "    set undolevels=1000          " Maximum number of changes that can be undone
        "    set undoreload=1000          " Maximum number lines to save for undo on a buffer reload
        "endif

        " To disable views add the following to your .vimrc.bundles.local file:
        "   let g:spf13_no_views = 1
        if !exists('g:spf13_no_views')
            " Add exclusions to mkview and loadview
            " eg: *.*, svn-commit.tmp
            let g:skipview_files = [
                \ '\[example pattern\]'
                \ ]
        endif
    " }

    set foldenable
    set foldmethod=indent
    set foldlevel=99

" }

" Vim UI {

    "if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
    "    let g:solarized_termcolors=256
    "    let g:solarized_termtrans=1
    "    let g:solarized_contrast="normal"
    "    let g:solarized_visibility="normal"
    "    color solarized
    "endif
    colorscheme molokai
    highlight NonText guibg=#060606
    highlight Folded  guibg=#0A0A0A guifg=#9090D0

    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode
    set shortmess=atI

    highlight clear SignColumn      " SignColumn should match background for
                                     " things like vim-gitgutter

    highlight clear LineNr          " Current line number row will have same background color in relative mode.
                                    " Things like vim-gitgutter will match LineNr highlight
    "highlight clear CursorLineNr    " Remove highlight color from current line number

    set cursorcolumn                " Highlight current column
    set cursorline                  " Highlight current line

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %p%)  " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        " set statusline+=%{fugitive#statusline()} " Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set foldenable                  " Auto fold code
    set nolist
    " Highlight problematic whitespace
    if WINDOWS()
        set listchars=tab:>-,trail:-,extends:#,nbsp:.
    else
        set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
    endif

" }

" Formatting {

    set nowrap                      " Wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    "set comments=sl:/*,mb:*,elx:*/  " Auto format comment blocks

    set encoding=utf-8
    set fileencoding=utf-8 enc=utf-8 tenc=utf-8
    set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
    set termencoding=utf-8

    set nobomb                      " no BOM (Byte Order Mark)

    set ffs=unix,dos,mac            " Use unix as the standard file type
    " Remove trailing whitespaces and ^M chars
    "autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()
    "autocmd FileType go autocmd BufWritePre <buffer> Fmt
    "autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    "autocmd FileType haskell setlocal expandtab shiftwidth=2 softtabstop=2

" }

" Key (re)Mappings {
    " The default leader is '\', but many people prefer ',' as it's in a
    " standard
    " locations. To override this behavior and set it back to '\' (or any
    " other
    " character) add the following to your .vimrc.bundles.local file:
    "   let g:spf13_leader='\'
    if !exists('g:spf13_leader')
        let mapleader = ','
    else
        let mapleader=g:spf13_leader
    endif
    if !exists('g:spf13_localleader')
        let maplocalleader = '_'
    else
        let maplocalleader = g:spf13_localleader
    endif

    " Easier moving in tabs and windows
    " The lines conflict with the default digraph mapping of <C-K>
    " If you prefer that functionality, and the following to your
    " .vimrc.before.local file:
    "   let g:spf13_no_easyWindows = 1
    if !exists('g:spf13_no_easyWindows')
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-L> <C-W>l<C-W>_
        map <C-H> <C-W>h<C-W>_
    endif

    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Most prefer to toggle search highlighting rather than clear the current
    " search results. To clear search highlighting rather than toggle it on
    " and off, and following to your .vimrc.before.local file:
    "   let g:spf13_clear_search_highlight = 1
    "if exists('g:spf13_clear_search_highlight')
        nmap <silent> <leader>/ :set nohlsearch<CR>
    "else
    "    nmap <silent> <leader>/ :set invhlsearch<CR>
    "endif

    " Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

    " Shortcuts
    " Change working directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Allow using the repeat operator with a visual selection (!)
    " http://stackoverflow.com/a/8064607/127816
    vnoremap . :normal .<CR>

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=expand('%:h').'/'<CR>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " Adjust viewports to the same size
    map <leader>= <C-w>=

    " Map <leader>ff to display all lines with keyword under cursor
    " and ask which one to jump to
    nmap <leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

    " Easier horizontal scrolling
    map zl zL
    map zh zH

    " Easier formatting
    nnoremap <silent> <leader>q gwip

    " Go Home and End using capitalized directions
    noremap H ^
    noremap L $

    noremap <F2> :set nonumber! number?<cr>
    noremap <F3> :set list! list?<cr>
    noremap <F4> :set wrap! wrap?<cr>

    inoremap <leader><leader> <c-x><c-o>

    " select all
    noremap <c-a> <esc>ggVG

    " exit insert mode
    inoremap jj <esc>

    if WINDOWS()
        " Ctrl + C/V/X for copy/past/cut
        map <c-c> "+y
        map <c-v> "+p
        map <c-x> "+x
    endif
" }

" Plugin Settings {

    " NerdTree {
        if isdirectory(expand("~/.vim/bundle/nerdtree"))
            map <C-e> <plug>NERDTreeTabsToggle<CR>
            map <leader>e :NERDTreeToggle<CR>
            nmap <leader>nt :NERDTreeFind<CR>

            let NERDTreeShowBookmarks=1
            let NERDTreeMinimalUI=1
            let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
            let NERDTreeChDirMode=0
            let NERDTreeQuitOnOpen=1
            let NERDTreeMouseMode=2
            "let NERDTreeShowHidden=1
            let NERDTreeKeepTreeInNewTab=1
            let NERDTreeWinSize=30
            let g:nerdtree_tabs_open_on_gui_startup=0
            let NERDTreeBookmarksFile=expand("~/.vim/.NERDTreeBookmarks")
        endif
    " }

    " TagBar {
        if isdirectory(expand("~/.vim/bundle/tagbar"))
            nnoremap <silent><leader>tt :TagbarToggle<CR>

            "let g:tagbar_autofocus=1
            " If using go please install the gotags program using the following
            " go install github.com/jstemmer/gotags
            " And make sure gotags is in your path
            let g:tagbar_type_go = {
                \ 'ctagstype' : 'go',
                \ 'kinds'     : [
                    \ 'p:package',
                    \ 'i:imports:1',
                    \ 'c:constants',
                    \ 'v:variables',
                    \ 't:types',
                    \ 'n:interfaces',
                    \ 'w:fields',
                    \ 'e:embedded',
                    \ 'm:methods',
                    \ 'r:constructor',
                    \ 'f:functions'
                    \ ],
                \ 'sro' : '.',
                \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
                \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
                \ 'ctagsbin' : 'gotags',
                \ 'ctagsargs' : '-sort'
                \ }
            let g:tarbar_compact = 1    " doesn't show 'help' in top of window
        endif
    " }

    " Vim-EasyMotion {
        " Default Trigger Key is <leader><leader>
        " example: type <leader><leader>w to trigger the word motion
        "          type <leader><leader>fo to trigger search 'o' character
    " }

    " vim-airline {
        let g:airline_powerline_fonts=1
        let g:airline_theme='dark'
        let g:airline#extensions#tabline#enabled=1
        "let g:airline_enable_branch=1
        "let g:airline_enable_syntastic=1
        "let g:airline_detect_paste=1
    " }

    " CtrlP {
        nnoremap <silent><leader>t :CtrlP<CR>
        nnoremap <silent><leader>r :CtrlPMRU<CR>
        nnoremap <silent><leader>b :CtrlPBuffer<CR>

        let g:ctrlp_working_path_mode='ra'
        let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|\.hg$\|\.svn%',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$',
        \ }

        " On windows use "dir" as fallback command.
        if has('win32') || has('win64')
            let g:ctrlp_user_command = {
                \ 'types': {
                    \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                    \ 2: ['.hg', 'hg --cmd %s localte -I .'],
                \ },
                \ 'fallback': 'dir %s /-n /b /s /a-d'
            \ }
        else
            let g:ctrlp_user_command = {
                \ 'types': {
                    \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                    \ 2: ['.hg', 'hg --cmd %s locate -I .'],
                \ },
                \ 'fallback': 'find %s -type f'
            \ }
        endif

        let g:ctrlp_working_path_mode=0
        let g:ctrlp_match_window_bottom=1
        let g:ctrlp_max_height=15
        let g:ctrlp_match_window_reversed=0
        let g:ctrlp_mruf_max=500
        let g:ctrlp_follow_symlinks=1
    " }

    " IndentLine {
        let g:indentLine_noConcealCursor=1
        let g:indentLine_color_term=0
        let g:indentLine_char='¦'
    " }

    " Vim-Expand-Region {
        map = <Plug>(expand-region-expand)
        map - <Plug>(expand-region-shrink)
    " }

    " Vim-Markdown {
        let g:vim_markdown_folding_disabled=1
    " }

" }

" GUI Settings {

    set t_Co=256                     " Enable for iTerm2 display color

    if has('gui_running')

        set guioptions-=T            " Exclude Toolbar
        set guioptions+=e            " Add tab pages
        set guioptions-=r            " Exclude Right-hand scrollbar
        set guioptions-=l            " Exclude Left-hand scrollbar
        set guioptions-=L            " Exclude Left-hand scrollbar even there is a vertically split window
        set guioptions-=m            " Exclude Menu bar
        set showtabline=1

        " Disable cursor flash
        set guicursor=a:block-blinkon0

        if has('gui_macvim')
            "set guifont=Source\ Code\ Pro\ for\ Powerline:h12
            set guifont=Menlo\ for\ Powerline:h11
            "set guifont=DejaVn\ Sans\ Mono\ for\ Powerline

            "set transparency=5      " Make the window slightly transparent
        endif

        if has('gui_win32')
            set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
            language messages en_US.UTF-8

            " support windows ctrl-c,ctrl-v,ctrl-x
            "map <c-c> "+y
            "map <c-v> "+p
            "map <c-x> "+x
        endif

    endif
" }
