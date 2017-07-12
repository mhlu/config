" this file is organized as:
" general config -> plugin config -> language specific config
set nocompatible
set shell=/bin/bash

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'sjl/gundo.vim'
Plug 'bronson/vim-visual-star-search'

Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'ton/vim-bufsurf'
Plug 'kien/ctrlp.vim'
Plug 'alvan/vim-closetag'
Plug 'easymotion/vim-easymotion'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'junegunn/vim-easy-align'
Plug 'osyo-manga/vim-over'       "substitue
Plug 'rhysd/clever-f.vim'
Plug 'rstacruz/vim-closer'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree',      { 'on': 'NERDTreeTabsToggle' }
Plug 'jistr/vim-nerdtree-tabs',  { 'on': 'NERDTreeTabsToggle' }
Plug 'vim-scripts/matchit.zip'
Plug 'wellle/targets.vim'        "more text object, eg. di2{
Plug 'zefei/vim-wintabs'
Plug 'yggdroot/indentline',      { 'for': ['coffee'] }
Plug 'tpope/vim-endwise',        { 'for': 'ruby'  }
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee'] }

" useful but unneeded for now
" Plug 'fisadev/vim-isort',       { 'for': 'python' }
"Plug 'majutsushi/tagbar',       { 'for': ['c', 'cpp', 'go', 'python'] }
"Plug 'scrooloose/syntastic',    { 'for': ['c', 'cpp', 'go', 'python'] }

" testing
"Plug 'kana/vim-textobj-user'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'junegunn/vim-peekaboo'

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
vnoremap ; :
nnoremap ; :

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
" remove trailing while space
nnoremap <localleader>s :%s/\s\+$//<CR>
vnoremap <localleader>s :%s/\s\+$//<CR>
syntax enable

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

" Buffer - do backup in git
set nobackup
set nowritebackup
set noswapfile
set autoread
set hidden
set confirm
if !exists(':W')
  command W w !sudo tee % > /dev/null
endif

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
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=10
let g:ctrlp_dotfiles=0
let g:ctrlp_custom_ignore = {
  \ 'dir':  'bin$\|\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(pyc|o|d|so|a)$',
  \ }

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
map gj <Plug>(easymotion-j)
map gk <Plug>(easymotion-k)
let g:EasyMotion_startofline = 0

" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | execute 'NERDTreeTabsToggle' | endif
nmap <Leader>t :NERDTreeTabsToggle<CR>
vmap <Leader>t :NERDTreeTabsToggle<CR>
nmap <Leader>f :NERDTreeTabsFind<CR>
vmap <Leader>f :NERDTreeTabsFind<CR>
let NERDTreeIgnore=['\.pyc$', '\~$', '\.o$', '\.d$', '\.so$', '\.a$']

" syntastic
"let g:syntastic_mode_map = { 'mode': 'passive',
    "\ 'active_filetypes': [],
    "\ 'passive_filetypes': [] }
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_python_python_exec = '/usr/local/bin/python3'
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" bufsurf - literally why isn't this a standard vim feature???
nmap <leader>p :BufSurfBack<CR>
vmap <leader>p :BufSurfBack<CR>
nmap <leader>n :BufSurfForward<CR>
vmap <leader>n :BufSurfForward<CR>

" easy align
nmap ga <Plug>(EasyAlign)
vmap ga <Plug>(EasyAlign)

" tagbar
"nmap <F8> :TagbarToggle<CR>

" vim over
nmap gs :OverCommandLine<CR>%s/
vmap gs :OverCommandLine<CR>s/

" close tags
let g:closetag_filenames = "*.html,*.html.erb"

" gundo
nnoremap <F5> :GundoToggle<CR>

" wintab
nnoremap gh gT
nnoremap gl gt
nnoremap gj :WintabsPrevious <CR>
nnoremap gk :WintabsNext<CR>
nnoremap gc :WintabsClose
nnoremap go :WindtabsOpen
nnoremap gC :WindtabsCloseWindow
nnoremap gO :WindtabsOpenWindow
command! Tabc WintabsCloseVimtab
command! Tabo WintabsOnlyVimtab
let g:wintabs_display = 'statusline'
let g:wintabs_ui_show_vimtab_name = 1
let g:wintabs_ui_sep_inbetween = '$'
let g:wintabs_ui_sep_rightmost = ' '
