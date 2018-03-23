set nocompatible
filetype off
filetype plugin indent on

call plug#begin('~/.vim-plug')

Plug 'tpope/vim-fugitive'
Plug 'altercation/solarized', {'rtp': 'vim-colors-solarized/'}
Plug 'solarnz/arcanist.vim'
Plug 'bling/vim-airline'
Plug 'kevints/vim-aurora-syntax'
Plug 'tpope/vim-commentary'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-surround'
Plug 'stephpy/vim-yaml'
Plug 'solarnz/thrift.vim'
Plug 'wting/rust.vim'
Plug 'fatih/vim-go'
Plug 'b4b4r07/vim-hcl'
Plug 'cespare/vim-toml'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi-vim'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier'
Plug 'Vimjas/vim-python-pep8-indent'

if has('nvim')
    Plug 'roxma/nvim-completion-manager'
    Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
endif

call plug#end()

syntax on

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set autoindent
set copyindent
set number
set hlsearch
set ruler
set novisualbell
set noerrorbells
set backspace=indent,eol,start
set ignorecase
set smartcase
set wildmenu
set laststatus=2
set showbreak=>
set textwidth=78
set formatoptions=croqnl1
set cursorline
set relativenumber
set showmatch
set mouse=a

inoremap kj <ESC>
inoremap zkj <ESC>:w<CR>

let mapleader = ","

set listchars=tab:>-,trail:?,eol:$
nmap <silent> <leader>w :set nolist!<CR>
map <silent> <leader><space> :let @/=''<CR>

nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprev<CR>

" No arrow keys for you!
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>

" Set up shortcut for toggling number modes since numbertoggle doesn't do it
" for us anymore
nnoremap <silent> <C-n> :set relativenumber!<cr>

silent! colorscheme solarized
set background=dark

if exists('+colorcolumn')
    set colorcolumn=+1,120
endif


let g:airline_powerline_fonts = 1

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
let g:jedi#use_splits_not_buffers = 'left'
let g:jedi#use_tabs_not_buffers = 0
