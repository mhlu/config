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
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bitc/vim-hdevtools'


" end plugins
call vundle#end()
filetype plugin indent on

:if filereadable( "/etc/vimrc" )
   source /etc/vimrc
:endif

" arista specific things
:if filereadable( $VIM . "/vimfiles/arista.vim" )
   source $VIM/vimfiles/arista.vim
   set colorcolumn=86
:else
   syntax enable
   set tabstop=4
   set shiftwidth=4
   set softtabstop=4
   set expandtab
   set smarttab
   set autoindent
   set smartindent
   " autocmd BufWritePre * :%s/\s\+$//e
:endif

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" misc
vnoremap < <gv
vnoremap > >gv>
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

" everytime you use octal, increment this count - count=0
set nrformats=

" replace dumb as fuck paste default
vnoremap p "_dp
vnoremap <leader>p p

" Windows
set diffopt+=vertical
set splitbelow
set splitright

" why the fuck isn't there a map that is nv or nvi -_-
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


" use ag in ctrlp
" airline
" set laststatus=2


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
"hi link EasyMotionTarget ErrorMsg
"hi link EasyMotionShade  Comment
"hi link EasyMotionTarget2First ErrorMsg
"hi link EasyMotionTarget2Second ErrorMsg
nmap s <Plug>(easymotion-bd-w)
vmap s <Plug>(easymotion-bd-w)
nmap \f <Plug>(easymotion-bd-f)
nmap \f <Plug>(easymotion-bd-f)

" NerdTree
nnoremap <leader>t :NERDTreeToggle<CR>
vnoremap <leader>t :NERDTreeToggle<CR>

" maximize and normalize a window
nnoremap <leader>z <C-W>_<C-W><Bar>
vnoremap <leader>z <C-W>_<C-W><Bar>
nnoremap <leader><leader>z <C-W>=
vnoremap <leader><leader>z <C-W>=

" syntastic
" On by default
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': [] }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" hdev tools
au FileType haskell nnoremap <leader><t> :HdevtoolsType<CR>
au FileType haskell nnoremap <leader><c> :HdevtoolsClear<CR>
