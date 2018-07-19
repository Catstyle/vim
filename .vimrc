let mapleader=";" " prefix ';'
set nocompatible " explictly get out of vi-compatible mode

" init pathogen
execute pathogen#infect()

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
set fileformats=unix "换行使用unix方式

set termencoding=UTF-8
set encoding=UTF-8

" python
set backspace=2
set colorcolumn=80

set autoread

" shortcut

vnoremap <Leader>y "+y
nmap <Leader>p "+p

nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>WQ :wa<CR>:q<CR>
nmap <Leader>Q :qa!<CR>
nmap <Leader>b :<C-U>exe "buffer ".v:count<CR>
nmap <Leader>wr <C-W><C-R>
nmap <Leader>e :e<SPACE>
nmap <Leader>vs :vs<SPACE>

nmap <Leader>pa %

nnoremap <Leader>nw <C-W><C-W>
nnoremap <Leader>lw <C-W>l
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>kw <C-W>k
nnoremap <Leader>jw <C-W>j
nnoremap <C-k>  mz:m-2<cr>`z==
nnoremap <C-j>  mz:m+<cr>`z==
xnoremap <C-k>  :m'<-2<cr>gv=gv
xnoremap <C-j>  :m'>+<cr>gv=gv

map <F5> :w<cr> :!python %<cr>
map <F6> :w<cr> :!go run %<cr>
nmap <F8> :TagbarToggle<CR>

"search in project
nnoremap <Leader>sp :Grep -ir<CR><CR><CR>
"search in buffer
nnoremap <Leader>sb :GrepBuffer -ir<CR><CR>

" line begin / line end
nmap <Leader>lb 0
nmap <Leader>le $

" plugins

let g:virtualenv_auto_activate=$VIM_ACTIVATE_PYTHON

" taglist
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的 
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim

" mini buf
"let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
autocmd FileType python set omnifunc=pythoncomplete#Complete

" ale
let g:ale_lint_on_text_changed = 'normal'
let g:ale_fix_on_save = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_set_quickfix = 1
let g:ale_open_list = 1
