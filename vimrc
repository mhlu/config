" this file is organized as:
" general config -> plugin config -> language specific config
set nocompatible
set shell=/bin/bash

call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'bling/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'altercation/vim-colors-solarized'
Plug 'wellle/targets.vim'     "more text object, eg. di2{
Plug 'osyo-manga/vim-over'    "substitue
Plug 'Raimondi/delimitMate'   "auto brackets insertion
Plug 'scrooloose/nerdtree',     { 'on': 'NERDTreeTabsToggle' }
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }
Plug 'fatih/vim-go',            { 'for': 'go' }
Plug 'Yggdroot/indentLine',     { 'for': 'python' }
Plug 'scrooloose/syntastic',    { 'for': ['c', 'cpp', 'go', 'python'] }
Plug 'fisadev/vim-isort',       { 'for': 'python' }

" testing
Plug 'sjl/gundo.vim'
Plug 'majutsushi/tagbar',       { 'for': ['c', 'cpp', 'go', 'python'] }
Plug 'bufkill.vim'

call plug#end()

:if filereadable( "/etc/vimrc" )
   source /etc/vimrc
:endif

" misc
filetype plugin indent on
set backspace=2
set encoding=utf-8
set t_Co=256
set noeb vb t_vb= "remove bells
set ruler
set ttyfast
set showcmd
set lazyredraw
set formatoptions=l
set nostartofline
set mousehide mouse=a
set number
set wildmenu wildignore=*.o,*~,*.pyc
set ttimeoutlen=100
set cursorline
set lazyredraw
noremap <silent> Y y$
set nrformats=

autocmd Filetype python setlocal sw=2 ts=2 sts=2


" leader
let mapleader = " "
let maplocalleader = "\\"

" format
set colorcolumn=81
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set smartindent
vnoremap < <<
vnoremap > >>
vnoremap < <gv
vnoremap > >gv

" syntax
syntax enable
"set background=light
"colorscheme solarized

"display tab, indent,  and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
let g:indentLine_color_term = 239

" copy/paste
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]''`]`'
vnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]''`]`'

" maximize and normalize a window
nnoremap <leader>z <C-W>_<C-W><Bar>
vnoremap <leader>z <C-W>_<C-W><Bar>
nnoremap <leader><leader>z <C-W>=
vnoremap <leader><leader>z <C-W>=

" quick save/quit
nnoremap <leader>w :w<CR>
vnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
vnoremap <leader>q :q<CR>

" Windows
set diffopt+=vertical
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
vnoremap <C-J> <C-W><C-J>
inoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
vnoremap <C-K> <C-W><C-K>
inoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
vnoremap <C-L> <C-W><C-L>
inoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
vnoremap <C-H> <C-W><C-H>
inoremap <C-H> <C-W><C-H>

" Movement
set nostartofline
set whichwrap+=<,>,h,l,[,]
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk
nnoremap H ^
vnoremap H ^
nnoremap L g_
vnoremap L g_

" Buffer
set nobackup
set nowritebackup
set noswapfile
set autoread
set hidden
set confirm
nmap <leader>p :bp<CR>
vmap <leader>p :bp<CR>
nmap <leader>n :bn<CR>
vmap <leader>n :bn<CR>
command W w !sudo tee % > /dev/null

" Search
set hlsearch
set ignorecase
set smartcase
set incsearch
nmap <leader>/ :nohlsearch<CR>
vmap <leader>/ :nohlsearch<CR>

" Ctrl P
nmap <C-n> :CtrlPBuffer<CR>
vmap <C-n> :CtrlPBuffer<CR>

" Buff Kill
nmap <leader>k :BD<CR>
vmap <leader>k :BD<CR>

" Easy Motion
let g:EasyMotion_do_mapping=0
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
hi link EasyMotionTarget2First ErrorMsg
hi link EasyMotionTarget2Second ErrorMsg
nmap s <Plug>(easymotion-bd-w)
vmap s <Plug>(easymotion-bd-w)
nmap S <Plug>(easymotion-bd-e)
vmap S <Plug>(easymotion-bd-e)
nmap gf <Plug>(easymotion-bd-f)
vmap gf <Plug>(easymotion-bd-f)
map gj <Plug>(easymotion-j)
map gk <Plug>(easymotion-k)
let g:EasyMotion_startofline = 0

" NerdTree
nmap <Leader>t :NERDTreeTabsToggle<CR>
vmap <Leader>t :NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$', '\.o$']

" syntastic
let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': [] }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" airline/bufferline
let g:bufferline_echo = 0
set laststatus=2

" easy align
nmap ga <Plug>(EasyAlign)
vmap ga <Plug>(EasyAlign)

" tagbar
nmap <F8> :TagbarToggle<CR>

" vim over
nmap gs :OverCommandLine<CR>%s/
vmap gs :OverCommandLine<CR>s/
