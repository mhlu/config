" this file is organized as such
" general config -> plugin config -> language specific config
set nocompatible
set shell=/bin/bash
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" begin plugins
Plugin 'kien/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'junegunn/vim-easy-align'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'yonchu/accelerated-smooth-scroll'
Plugin 'davidhalter/jedi-vim'

" end plugins
call vundle#end()
filetype plugin indent on

:if filereadable( "/etc/vimrc" )
   source /etc/vimrc
:endif

" leader
let mapleader = " "

" format
set colorcolumn=81
syntax enable
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent
set smartindent
vnoremap < <gv
vnoremap > >gv

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" misc
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
nmap \f <Plug>(easymotion-bd-f)
nmap \f <Plug>(easymotion-bd-f)

" NerdTree
nnoremap <Leader>t :NERDTreeTabsToggle<CR>
vnoremap <Leader>t :NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']

" syntastic
let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': [] }
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

" easy align
" nmap ga <Plug>(EasyAlign)
" xmap ga <Plug>(EasyAlign)
