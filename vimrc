set nocompatible
filetype off

" ---------------------------------------------------------------------------
" Vundle setup
" ---------------------------------------------------------------------------

call plug#begin('~/.vim-plug')
Plug 'tpope/vim-fugitive'
Plug 'altercation/solarized', {'rtp': 'vim-colors-solarized/'}
Plug 'solarnz/arcanist.vim'
Plug 'vim-airline/vim-airline'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'
Plug 'klen/python-mode'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'kevints/vim-aurora-syntax'
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-surround'
Plug 'stephpy/vim-yaml'
Plug 'solarnz/thrift.vim'
Plug 'wting/rust.vim'
Plug 'vim-scripts/a.vim'
Plug 'b4b4r07/vim-hcl'
Plug 'cespare/vim-toml'
Plug 'leafgarland/typescript-vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-unimpaired'
Plug 'digitaltoad/vim-pug'
Plug 'Quramy/tsuquyomi'
Plug 'prettier/vim-prettier'
Plug 'wavded/vim-stylus'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'honza/vim-snippets'

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'

    Plug 'flowtype/vim-flow'
    Plug 'w0rp/ale'

    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'

    nnoremap <c-p> :FZF<cr>
endif

call plug#end()

filetype plugin indent on

" ---------------------------------------------------------------------------
" Everything else
" ---------------------------------------------------------------------------

syntax on

" Fixes for xterm-256colors
if &term =~ "xterm"
 set t_Co=256
 if has("terminfo")
   let &t_Sf=nr2char(27).'[3%p1%dm'
   let &t_Sb=nr2char(27).'[4%p1%dm'
 else
   let &t_Sf=nr2char(27).'[3%dm'
   let &t_Sb=nr2char(27).'[4%dm'
 endif
endif

let mapleader = ","

set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set softtabstop=2
set autoindent
set copyindent
set number
set hlsearch
set incsearch
set ruler
set novisualbell
set backspace=indent,eol,start
set ignorecase
set smartcase
set wildmenu
set laststatus=2
set showbreak=>
set textwidth=78
set formatoptions=croqnl1
set cursorline
set backupcopy=yes

if exists('+colorcolumn')
    set colorcolumn=+1,120
endif

" Enable xterm mouse support
set mouse=a

" Move swap files and stuff
if has("win32")
   set directory=$TEMP
else
   set directory=~/.vim/tmp,/tmp
endif

" Key mappings
nmap <C-F4> :tabclose<CR>
vmap <leader>c <esc>:'<,'>:CoffeeCompile<CR>
map <silent> <leader><space> :let @/=''<CR>
inoremap kj <ESC>
inoremap zkj <ESC>:w<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>nf :NERDTreeFind<CR>
nmap <silent> <leader>ti :TsuImport<CR>

nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprev<CR>
nnoremap tt  :tabedit ~/.vimrc<CR>

" No arrow keys for you!
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>

set listchars=tab:>-,trail:?,eol:$
nmap <silent> <leader>w :set nolist!<CR>

" Filetype associations
autocmd BufRead,BufNewFile /etc/nginx/conf.d/* set ft=nginx
autocmd BufRead,BufNewFile *.json set ft=javascript

" Highlight VCS merge errors
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

syn keyword globalTodo TODO FIXME XXX contained
hi def link globalTodo Todo

if has('autocmd')
    augroup vimrc_autocmds
        au!
        " Enable text wrapping for text files
        autocmd BufRead,BufNewFile *.{txt,markdown,mkd,twiki} set formatoptions+=t

        " Formatting options for markdown files
        autocmd BufRead *.{mkd,markdown} set ai formatoptions=tcroqn2 comments=n:&gt;
    augroup END
endif

let NERDTreeDirArrows=0
let g:NERDTreeWinSize=60
let NERDTreeQuitOnOpen=1

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

let g:airline_powerline_fonts = 1
" vim-airline {
    " Set configuration options for the statusline plugin vim-airline.
    " Use the powerline theme and optionally enable powerline symbols.
    " To use the symbols , , , , , , and .in the statusline
    " segments add the following to your .vimrc.before.local file:
    "   let g:airline_powerline_fonts=1
    " If the previous symbols do not render for you then install a
    " powerline enabled font.

    " See `:echo g:airline_theme_map` for some more choices
    " Default in terminal vim is 'dark'
    if isdirectory(expand("~/.vim/bundle/vim-airline-themes/"))
        if !exists('g:airline_theme')
            let g:airline_theme = 'solarized'
        endif
        if !exists('g:airline_powerline_fonts')
            " Use the default set of separators with a few customizations
            let g:airline_left_sep='›'  " Slightly fancier than '>'
            let g:airline_right_sep='‹' " Slightly fancier than '<'
        endif
    endif
" }


let g:pymode_doc = 0
"let g:pymode_folding = 0
let g:pymode_lint_on_write = 0
let g:pymode_rope = 0
let g:pymode_run = 0
let g:pymode_utils_whitespaces = 0

let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
let g:jedi#use_splits_not_buffers = 'left'
let g:jedi#use_tabs_not_buffers = 0

let g:alternateExtensions_jsx = "scss,css"
let g:alternateExtensions_js = "scss,css"
let g:alternateExtensions_css = "jsx,js,ts"
let g:alternateExtensions_scss = "jsx"

let g:jsx_ext_required = 0
" typescript 
let g:tsuquyomi_single_quote_import = 1
let g:tsuquyomi_shortest_import_path = 1

syntax enable
silent! colorscheme solarized
set background=dark

if exists('+colorcolumn')
    set colorcolumn=+1,120
endif

ab clog console.log(<Left>

set foldmethod=syntax
set foldlevel=99

"autocmd FileType javascript,typescript,css,less,json setlocal foldlevel=99
"autocmd FileType javascript,typescript,css,less,json setlocal foldmethod=marker
"autocmd FileType javascript,typescript,css,less,json setlocal foldmarker={,}
"
"
"Ack settings
"open a new tab and search for something

nmap <leader>a :tab split<CR>:Ack --ts --pug ""<Left>
"search for the word under cursor
nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>
