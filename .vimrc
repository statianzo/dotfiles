call pathogen#runtime_append_all_bundles()
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax on
colorscheme base16-eighties
set background=dark
filetype plugin indent on

set nocompatible  " We don't want vi compatibility.

let mapleader=","

map th :tabfirst<CR>
map tj :tabprev<CR>
map tk :tabnext<CR>
map tl :tablast<CR>
map tt :tabedit<Space>
map tn :tabnext<Space>
map tm :tabm<Space>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <F1> <nop> 
nmap K <nop>

syntax enable

set cf  " Enable error files & error jumping.
set clipboard=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)

"  " Formatting (some of these are for coding in C and C++)
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set hlsearch
"set cinoptions+=j1
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab

"   " Visual
set showmatch  " Flash matching brackets
set mat=2  " Bracket blinking.
set list
set lcs=tab:>.,trail:.,extends:#,nbsp:.
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=0  " Always show status line.

set pastetoggle=<F2> 

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

map <F4> :execute "Ack " . expand("<cword>")<Bar> cw<CR>
map ,n :NERDTreeToggle<CR>
nmap ,m :NERDTreeClose<CR>:NERDTreeFind<CR>
map ,s :SyntasticToggleMode<CR>

autocmd! BufWritePost * Neomake

set backupdir=$HOME/.cache/vim"
set directory=$HOME/.cache/vim//"
silent execute "!mkdir -p $HOME/.cache/vim"

set wildignore +=*/.git/*
set wildignore +=*.ipc
set wildignore +=*.swp

set wildignore +=target
set wildignore +=project
set wildignore +=lib_managed
set wildignore +=_site
set wildignore +=node_modules
set wildignore +=cache
set wildignore +=tmp

set suffixesadd+=.js

let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'vendor\/'

"Shove selected lines into clipboard
vmap Y :w !xclip<CR><CR>

let g:syntastic_coffee_checkers=['coffee']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_html_tidy_ignore_errors=[
  \ 'trimming empty'
  \]
"let g:syntastic_javascript_eslint_exec='eslint_d'

let g:jsx_ext_required = 0
let g:ackprg = 'ag --vimgrep'

let g:neomake_error_sign={'text': '❌', 'texthl': 'NeomakeErrorMsg'}
let g:neomake_warning_sign={'text': '⚠️', 'texthl': 'NeomakeErrorMsg'}
let g:neomake_javascript_enabled_makers = ['eslint_d', 'eslint', 'jshint']
let g:neomake_jsx_enabled_makers = ['eslint_d', 'eslint']

set fillchars+=vert:\ 
highlight VertSplit ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE
highlight link xmlEndTag xmlTag
highlight LineNr ctermfg=0
