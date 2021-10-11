let mapleader=";" " prefix ';'
set nocompatible " explictly get out of vi-compatible mode

"=====================
" general settings
"=====================
filetype on
filetype plugin on
filetype plugin indent on

" syntax should after filetype
syntax enable
syntax on " syntax highlighting on

" 设置为双字宽显示，否则无法完整显示如:☆
" set ambiwidth=double
set number " turn on line numbers
set relativenumber
set ruler "always show current position along the bottom
set laststatus=2 "always show status
" set cursorline      "highlight current line
" set cursorcolumn    "highlight current column

set colorcolumn=100
set signcolumn=yes                   " Always show the sign column
set backspace=indent,eol,start
set termwinsize=10*0
set splitbelow
set updatetime=200

set autoread
set noshowmode  " show mode in airline
" set noshowmatch

" search settings
set incsearch " do highlight as you type you search phrase
set hlsearch
set ignorecase " case insensitive by default
set smartcase " if there are caps, go case-sensitive

set path+=**  " append subdirectories/subdirectories...

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

" encoding settings
set fileencodings=UCS-BOM,UTF-8,GBK,BIG5,latin1
set fileencoding=UTF-8
set fileformat=unix
set fileformats=unix

set termencoding=UTF-8
set encoding=UTF-8

" increased maxmempattern size
set mmp=2000
set shortmess+=c                     " Silence completion messages
set shortmess-=S                     " Enable showing the search index
set showbreak=>>>                    " Show clearly were linebreaks are applied
set spelllang=en_us                  " Set default spell check language to English US

" wildmenu completion settings
set wildmenu
set wildmode=list:full                           " Wildcard matches the longest and shows a list
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

" completion settings
set completeopt=menu,menuone,popup,preview,noselect,noinsert

"
" color
"
set background=dark " we plan to use a dark background
set t_Co=256
" set termguicolors  " donot set this, :ter will look strange

""""""""""""""""""""
packadd! edge
let g:edge_style = 'aura'
let g:edge_transparent_background = 1
let g:edge_diagnostic_text_highlight = 1

colorscheme edge

" reduce color of colorcolumn
highlight ColorColumn ctermbg=0

" for vim inside tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set term=xterm-256color
set gcr=a:block-blinkon0 " no blink cursor
" set guifont=Source\ Code\ Pro\ For\ Powerline:h15
set guifont=MesloLGS\ NF:h15

"
" shortcuts
"

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

"search in project
nnoremap <Leader>sp :Grep -r<CR><CR><CR>
"search in buffer
nnoremap <Leader>sb :GrepBuffer -r<CR><CR>

" line begin / line end
nmap <Leader>lb 0
nmap <Leader>le $

" for GUI/with register
" vnoremap <Leader>y "+y
" nmap <Leader>p "+p

" a hacky solution to share clipboard content between vim instances
" save selected lines into a tmp file
vmap <leader>y :w! ~/.vimtmp<CR>
" load content from the tmp file and paste
nmap <leader>p :r! cat ~/.vimtmp<CR>


function! ScrollPopup(down)
    " let winid = popup_findinfo()
    " let winid = popup_findpreview()

    " HACKY!!!! findinfo/findpreview cannot find one!
    let winid = popup_list()
    if winid == []
        return 0
    endif
    " naive
    let winid = winid[0]

    " if the popup window is hidden, bypass the keystrokes
    let pp = popup_getpos(winid)
    if pp.visible != 1
        return 0
    endif

    let firstline = pp.firstline + a:down
    let buf_lastline = str2nr(trim(win_execute(winid, "echo line('$')")))
    if firstline < 1
        let firstline = 1
    elseif pp.lastline + a:down > buf_lastline
        let firstline = firstline - a:down + buf_lastline - pp.lastline
    endif

    " The appear of scrollbar will change the layout of the content which will cause inconsistent height.
    call popup_setoptions( winid, { 'firstline' : firstline } )
    " missing redraw will not take effect?!
    redraw

    return 1
endfunction

nnoremap <nowait><expr> <C-e> ScrollPopup(3) ? '' : '<C-e>'
nnoremap <nowait><expr> <C-y> ScrollPopup(-3) ? '' : '<C-y>'
inoremap <nowait><expr> <C-e> ScrollPopup(3) ? '' : '<C-e>'
inoremap <nowait><expr> <C-y> ScrollPopup(-3) ? '' : '<C-y>'


"
" python
"
autocmd FileType python setlocal colorcolumn=79
autocmd FileType python nmap <leader>r :ter python %<CR>
autocmd FileType python nmap <leader>t :ter pytest %<CR>


"
" yaml
"
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2

"
" markdown
"

" Treat all .md files as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Highlight the line the cursor is on
autocmd FileType markdown setlocal cursorline

" Hide and format markdown elements like **bold**
autocmd FileType markdown setlocal conceallevel=2

" Set spell check to British English
" autocmd FileType markdown setlocal spell spelllang=en_gb

"
" reStructureText
"
autocmd FileType rst nmap <leader>ctt :<C-U>exe "RivTitle".v:count<CR>


""""""""""""""""""" plugins """""""""""""""""""""""""


"
" airline
"
let g:airline_theme = 'deus'
" let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1

" branch - hunks
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}%{airline#util#wrap(airline#extensions#hunks#get_hunks(),100)}'

" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '  "tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'  "tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#buffer_nr_show = 1  "tabline中buffer显示编号

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"


"
" taglist
"
let Tlist_Show_One_File = 1  "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1  "如果taglist窗口是最后一个窗口，则退出vim

"
" tagbar
"
nmap <leader>tt :TagbarToggle<CR>
let g:tagbar_position = 'leftabove vertical'


"
" ale
"
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1

let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = ''

let g:ale_lint_on_text_changed = 'never'
" let g:ale_fix_on_save = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %code: %%s [%severity%]'

let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 1

let g:ale_hover_cursor = 1
let g:ale_floating_preview = 1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']

nnoremap <leader>gd :ALEGoToDefinition<CR>
nnoremap <leader>fr :ALEFindReferences<CR>
nnoremap <leader>s :ALEHover<CR>
nmap <C-n> <Plug>(ale_next_wrap)
nmap <C-p> <Plug>(ale_previous_wrap)
nmap <C-s> <Plug>(ale_hover)


let g:ale_linters = {
\   'python': ['flake8', 'pylint', 'pylsp'],
\   'javascript': ['eslint'],
\   'go': ['gopls'],
\   'rust': ['cargo', 'analyzer'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autopep8'],
\   'javascript': ['eslint'],
\   'go': ['gofmt', 'goimports', 'golines'],
\   'rust': ['rustfmt'],
\}

"
" vim-go
"
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

let g:go_code_completion_enabled = 0  " use ale for completion

let g:go_auto_type_info = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
" let g:go_auto_sameids = 1 " highlighting the same identifier

"""""""""""""""""""""""""""""""
" need to call GoInstallBinaries/GoUpdateBinaries for new version
"""""""""""""""""""""""""""""""
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_fmt_command = "goimports" " add missing imports when save file
let g:go_test_timeout = '10s'

" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" let g:go_metalinter_autosave = 1

" vim-go shortcut
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>bd  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run-split)
autocmd FileType go nmap <leader>R  :ter go run main.go<CR>
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)


"
" rust
"
autocmd BufNewFile,BufRead *.rs setlocal noexpandtab colorcolumn=99 textwidth=99

" ale
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')

" rust.vim
let g:rustfmt_autosave = 1

" rust shortcut
autocmd FileType rust nmap <leader>bd :ter cargo build<CR>
autocmd FileType rust nmap <leader>br :ter cargo build --release<CR>
autocmd FileType rust nmap <leader>r :ter cargo run<CR>
autocmd FileType rust nmap <leader>R :ter cargo run --release<CR>
autocmd FileType rust nmap <leader>f :ter ++hidden cargo fmt<CR>
autocmd FileType rust nmap <Leader>c :ter cargo check<CR>
autocmd FileType rust nmap <Leader>d :ter ++shell RUST_BACKTRACE=1 cargo run<CR>
autocmd FileType rust nmap <Leader>t :ter cargo test<CR>


"
" vim rst plugin: riv.vim
"
let g:riv_disable_folding = 1

"
" jedi-vim
"

" <leader>r almost map to run code
let g:jedi#rename_command = "<leader>rn"

let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 2
let g:jedi#smart_auto_mappings = 1

"
" ultisnips
"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/mysnippets']
let g:UltiSnipsExpandTrigger = "<C-s><C-i>"
