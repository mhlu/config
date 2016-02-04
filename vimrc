" this file is organized as such
" general config -> plugin config -> language specific config
set nocompatible
set shell=/bin/bash

call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeTabsToggle' }
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'bling/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/syntastic', { 'for': ['python', 'cpp'] }
Plug 'davidhalter/jedi-vim', { 'for': ['python'] }
call plug#end()

:if filereadable( "/etc/vimrc" )
   source /etc/vimrc
:endif

" misc
filetype plugin indent on
set backspace=2
set encoding=utf-8
set t_Co=256
set noeb vb t_vb=
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
" everytime you use octal, increment this count - count=0
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
nnoremap <leader>Q :wq<CR>
vnoremap <leader>Q :wq<CR>

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
command W w !sudo tee % > /dev/null

" Search
set hlsearch
set ignorecase
set smartcase
set incsearch
nnoremap <leader>/ :nohlsearch<CR>
vnoremap <leader>/ :nohlsearch<CR>

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
nmap <leader>f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-bd-f)

" NerdTree
nnoremap <Leader>t :NERDTreeTabsToggle<CR>
vnoremap <Leader>t :NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']

" syntastic
let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': ['python'],
    \ 'passive_filetypes': [] }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
nnoremap <silent> <F5> :SyntasticCheck<CR>
vnoremap <silent> <F5> :SyntasticCheck<CR>


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
