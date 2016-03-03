" this file is organized as such
" general config -> plugin config -> language specific config
set nocompatible
set shell=/bin/bash

call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'bufkill.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'bling/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'osyo-manga/vim-over'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'scrooloose/nerdtree',     { 'on': 'NERDTreeTabsToggle' }
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }
Plug 'scrooloose/syntastic',    { 'for': ['c', 'cpp', 'go', 'python'] }
Plug 'majutsushi/tagbar',       { 'for': ['c', 'cpp', 'go', 'python'] }
Plug 'davidhalter/jedi-vim',    { 'for': ['python'] }
Plug 'jpalardy/vim-slime',      { 'for': ['python']}

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
set clipboard+=unnamed
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


" leader
let mapleader = " "

" format
set colorcolumn=81
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent
set smartindent
nnoremap < <
nnoremap > >
vnoremap < <gv
vnoremap > >gv

" syntax
syntax enable

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

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
nnoremap <leader> :nohlsearch<CR>
vnoremap <leader> :nohlsearch<CR>

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
nmap <C-f> <Plug>(easymotion-bd-f)
vmap <C-f> <Plug>(easymotion-bd-f)

" NerdTree
nnoremap <Leader>t :NERDTreeTabsToggle<CR>
vnoremap <Leader>t :NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$', '\.o$']

" syntastic
"let g:syntastic_mode_map = { 'mode': 'passive',
    "\ 'active_filetypes': [],
    "\ 'passive_filetypes': [] }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" airline/bufferline
let g:bufferline_echo = 0
set laststatus=2

" jedi
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#auto_initialization = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#completions_command = "<C-Space>"

" easy align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" slime
"let g:slime_target = "tmux"
"let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
"let g:slime_python_ipython = 1

" tagbar
nmap <F8> :TagbarToggle<CR>
