set nocompatible
filetype off
filetype plugin indent on

call plug#begin('~/.vim-plug')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
"Plug 'altercation/solarized', {'rtp': 'vim-colors-solarized/'}
Plug 'ericbn/vim-solarized'
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
Plug 'vim-scripts/a.vim'
Plug 'preservim/nerdtree'
Plug 'digitaltoad/vim-pug'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'Shougo/neosnippet.vim'
Plug 'honza/vim-snippets'
Plug 'jparise/vim-graphql'
Plug 'zainin/vim-mikrotik'
Plug 'editorconfig/editorconfig-vim'
Plug 'saltstack/salt-vim'
Plug 'jxnblk/vim-mdx-js'
Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
Plug 'tpope/vim-unimpaired'

if has('nvim')
    Plug 'flowtype/vim-flow'
    Plug 'w0rp/ale'


    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'

    "nnoremap <c-p> :FZF<cr>
endif

call plug#end()

syntax on

set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set softtabstop=2
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

" COCCCCC
" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" https://github.com/neoclide/coc.nvim
" Remap keys for applying codeAction to the current line.
" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" End COC

set listchars=tab:>-,trail:?,eol:$
nmap <silent> <leader>w :set nolist!<CR>
map <silent> <leader><space> :let @/=''<CR>
" Nerd tree
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>

let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSize = 60

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

let g:current_colorscheme = "light"

" Enable 256 colors
set t_Co=256

" Ensure Vim is aware of the terminal type
if &term =~ '256color'
    set t_Co=256
endif

" Use true color if supported
if (has("nvim") || has("termguicolors"))
    set termguicolors
endif

" Set the Solarized color scheme
let g:solarized_termcolors=256
syntax enable
set background=light
colorscheme solarized

if exists('+colorcolumn')
    set colorcolumn=+1,120
endif


let g:airline_powerline_fonts = 1

if executable('rg')
  set grepprg=rg\ --color=never
endif

let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
let g:jedi#use_splits_not_buffers = 'left'
let g:jedi#use_tabs_not_buffers = 0

let g:deoplete#enable_at_startup = 1

let g:neosnippet#disable_runtime_snippets = {
    \ '_' : 1,
    \ }
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim-plug/vim-snippets/snippets'

let g:alternateExtensions_jsx = "scss,css"
let g:alternateExtensions_js = "scss,css"
let g:alternateExtensions_css = "jsx,js"
let g:alternateExtensions_scss = "jsx"

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:flow#showquickfix = 0

" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
let g:ale_linters = {
\  'javascript': ['flow', 'eslint'],
\  'python': [],
\  'java': []
\}
let g:ale_fixers = {
\  'javascript': ['prettier']
\}
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_fix_on_save = 1
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

nnoremap <silent> <leader>l :call system('arc browse ' . expand('%:p') . ':' . line('.'))<CR>
vnoremap <silent> <leader>l :<C-U>call system('arc browse ' . expand('%:p') . ':' . line("'<") . '-' . line("'>"))<CR>
nnoremap tt :e $MYVIMRC<CR>

set conceallevel=0

function! ToggleColorScheme()
  if g:current_colorscheme == "dark"
    let g:current_colorscheme = "light"
    set background=light
  else
    let g:current_colorscheme = "dark"
    set background=dark
  endif
endfunction

nnoremap <Leader>b :call ToggleColorScheme()<CR>

let g:python_host_prog = "user/bin/python3"

let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 0

" Map CtrlP to use ripgrep with fzf
" command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(''), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nnoremap <C-p> :Files<CR>
vnoremap <C-p> :Files<CR>

inoremap clog console.log('

" Autocmd that triggers after quitting Vim
autocmd VimLeave * call ClearSwapFiles()

" Function to remove swap files for buffers with no changes
function! ClearSwapFiles()
  " Loop through all buffers
  for buf in range(1, bufnr('$'))
    " Check if buffer exists and is not modified
    if bufexists(buf) && !getbufvar(buf, '&mod')
      let swapfile = getbufvar(buf, '&swapfile')
      let filename = bufname(buf)
      " If swapfile is set and file exists
      if swapfile && !empty(filename) && filewritable(filename) == 2
        let swapname = swapname(filename, v:servername, buf)
        " If the swap file exists, remove it
        if filewritable(swapname) == 2
          call delete(swapname)
        endif
      endif
    endif
  endfor
endfunction
