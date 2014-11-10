let mapleader=";" " prefix ';'
set nocompatible " explictly get out of vi-compatible mode

" init pathogen
execute pathogen#infect()

vnoremap <Leader>y "+y
nmap <Leader>p "+p

nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>WQ :wa<CR>:q<CR>
nmap <Leader>Q :qa!<CR>

nmap <Leader>pa %

nnoremap <Leader>nw <C-W><C-W>
nnoremap <Leader>lw <C-W>l
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>kw <C-W>k
nnoremap <Leader>jw <C-W>j

set background=dark " we plan to use a dark background
set t_Co=16
colorscheme solarized " need to install https://github.com/Anthony25/gnome-terminal-colors-solarized first
let g:Powerline_colorscheme='solarized256'
set gcr=a:block-blinkon0 " no blink cursor
set guifont=YaHei\ Consolas\ Hybrid\ 11.5

syntax enable
syntax on " syntax highlighting on
set number " turn on line numbers
set ruler "always show current position along the bottom
set laststatus=2 "always show status
set cursorline      "highlight current line
"set cursorcolumn    "highlight current column

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

" line begin / line end
nmap <Leader>lb 0
nmap <Leader>le $

" indent
set autoindent " same level indent
set smartindent " next level indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" fold code
set foldmethod=manual
set nofoldenable

set fileencodings=UTF-8,GBK,BIG5,latin1
set fileencoding=UTF-8
set fileformat=unix "换行使用unix方式

" python
set backspace=2
set colorcolumn=79
"set textwidth=79

set autoread

nnoremap <C-k>  mz:m-2<cr>`z==
nnoremap <C-j>  mz:m+<cr>`z==
xnoremap <C-k>  :m'<-2<cr>gv=gv
xnoremap <C-j>  :m'>+<cr>gv=gv

" taglist
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的 
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim

" mini buf
"let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
autocmd FileType python set omnifunc=pythoncomplete#Complete

" If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" shortcut
map <F5> :w<cr> :!python %<cr>
nmap <F8> :TagbarToggle<CR>
let g:virtualenv_auto_activate=$VIM_ACTIVATE_PYTHON

"search in project
nnoremap <Leader>sp :Grep -ir<CR><CR><CR>
"search in buffer
nnoremap <Leader>sb :GrepBuffer -ir<CR><CR>
