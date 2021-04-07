let mapleader=";" " prefix ';'
set nocompatible " explictly get out of vi-compatible mode

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

set background=dark " we plan to use a dark background
" termguicolors
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_use16=0
let g:solarized_termtrans = 1
colorscheme solarized8_low

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set term=xterm-256color
set termencoding=utf-8
set gcr=a:block-blinkon0 " no blink cursor
" set guifont=Source\ Code\ Pro\ For\ Powerline:h15
set guifont=MesloLGS\ NF:h15

" indent
set autoindent " same level indent
set smartindent " next level indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" shortcut for disable auto indent when pasting
set pastetoggle=<F3>

" fold code
set foldmethod=manual
set nofoldenable

set fileencodings=UTF-8,GBK,BIG5,latin1
set fileencoding=UTF-8
set fileformat=unix "换行使用unix方式
set fileformats=unix "换行使用unix方式

set termencoding=UTF-8
set encoding=UTF-8
set updatetime=100
" increased maxmempattern size
set mmp=2000

" python
set backspace=2
set colorcolumn=79

set autoread

"
" shortcuts
"

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

" map <F5> :w<cr> :!python %<cr>
" map <F6> :w<cr> :!go run %<cr>
nmap <F8> :TagbarToggle<CR>

"search in project
nnoremap <Leader>sp :Grep -r<CR><CR><CR>
"search in buffer
nnoremap <Leader>sb :GrepBuffer -r<CR><CR>

" line begin / line end
nmap <Leader>lb 0
nmap <Leader>le $

" a hacky solution to share clipboard content between vim instances
" save selected lines into a tmp file
vmap <leader>y :w! ~/.vimtmp<CR>
" load content from the tmp file and paste
nmap <leader>p :r! cat ~/.vimtmp<CR>

" python
autocmd FileType python nmap <leader>r :!python %<CR>

"
" yaml
"
autocmd FileType yaml set tabstop=2
autocmd FileType yaml set shiftwidth=2
autocmd FileType yaml set softtabstop=2

""""""""""""""""""" plugins """""""""""""""""""""""""


"
" airline
"
let g:airline_theme='deus'
" let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1

let g:airline#extensions#branch#enabled=1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#tagbar#enabled=1
let g:airline#extensions#virtualenv#enabled=1

" branch - hunks
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}%{airline#util#wrap(airline#extensions#hunks#get_hunks(),100)}'

" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '  "tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'  "tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#buffer_nr_show = 1  "tabline中buffer显示编号


"
" taglist
"
let Tlist_Show_One_File = 1  "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1  "如果taglist窗口是最后一个窗口，则退出vim


"
" ale
"
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 1

"
" vim-go
"
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

let g:go_auto_type_info = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_auto_sameids = 1 " highlighting the same identifier

let g:go_fmt_command = "goimports" " add missing imports when save file
let g:go_test_timeout = '10s'

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1

map <C-n> :cnext<CR>
map <C-p> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" vim-go shortcut
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>bd  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

"
" vim markdown preview
"

" Treat all .md files as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Highlight the line the cursor is on
autocmd FileType markdown set cursorline

" Hide and format markdown elements like **bold**
autocmd FileType markdown set conceallevel=2

" Set spell check to British English
" autocmd FileType markdown setlocal spell spelllang=en_gb
