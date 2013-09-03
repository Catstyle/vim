set nocompatible " explictly get out of vi-compatible mode
set background=dark " we plan to use a dark background

syntax on " syntax highlighting on
set number " turn on line numbers
set ruler "always show current position along the bottom
set incsearch " do highlight as you type you search phrase
set hlsearch
set ignorecase " case insensitive by default
set smartcase " if there are caps, go case-sensitive

filetype on
filetype plugin on
filetype plugin indent on

set completeopt+=longest
set completeopt+=menu
set wildmenu
autocmd FileType python set omnifunc=pythoncomplete#Complete

" mini buf
"let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
" If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" indent
set autoindent " same level indent
set smartindent " next level indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" fold code
set foldmethod=manual

set cursorline      "高亮当前行背景
set fileencodings=UTF-8,GBK,BIG5,latin1
set fileencoding=UTF-8
set fileformat=unix "换行使用unix方式

" shortcut
map <F5> :w<cr> :!python %<cr>

" python
set backspace=2
set colorcolumn=79
"set textwidth=79

" taglist
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的 
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim

set autoread

nnoremap <C-k>  mz:m-2<cr>`z==
nnoremap <C-j>  mz:m+<cr>`z==
xnoremap <C-k>  :m'<-2<cr>gv=gv
xnoremap <C-j>  :m'>+<cr>gv=gv
