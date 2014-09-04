set t_Co=16
call pathogen#runtime_append_all_bundles()
syntax on
colorscheme zellner
set background=light
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


map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

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
set cinoptions=:0,p0,t0
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

let g:haddock_browser = "w3m"

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

map <F4> :execute "Ack " . expand("<cword>")<Bar> cw<CR>
map ,n :NERDTreeToggle<CR>
nmap ,m :NERDTreeClose<CR>:NERDTreeFind<CR>

au Bufenter *.hs compiler ghc
au BufRead,BufNewFile *.jade setfiletype jade
au BufRead,BufNewFile *.ng setfiletype mustache
au BufRead,BufNewFile *.clj setfiletype clojure
au BufRead,BufNewFile *.go setfiletype go

set backupdir=$HOME/.cache/vim"
set directory=$HOME/.cache/vim//"
silent execute "!mkdir -p $HOME/.cache/vim"

" VimClojure
let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow = 1
set wildignore +=*/.git/*
set wildignore +=*.ipc
set wildignore +=*.swp

set wildignore +=target
set wildignore +=project
set wildignore +=lib_managed
set wildignore +=_site

let g:ctrlp_custom_ignore = 'vendor\/'
let g:ctrlp_extensions = ['tag']
nnoremap <silent> <c-f> :<c-u>CtrlPTag<cr>


let loaded_matchparen = 1

"Shove selected lines into clipboard
vmap Y :w !xclip<CR><CR>

if has('gui_running')
  set guioptions -=m
  set guioptions -=T
  set guioptions -=r
  set guioptions -=L
  set guifont=Inconsolata:h14
endif

if has('mac')
  set shell=/bin/zsh
endif

let g:syntastic_scala_checkers=['fsc']
let g:syntastic_scala_options='-Ystop-after:icode'
let g:syntastic_coffee_checkers=['coffee']
let g:syntastic_html_tidy_ignore_errors=[
  \ 'trimming empty'
  \]

"au VimEnter * RainbowParenthesesActivate
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

