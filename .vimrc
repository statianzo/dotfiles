call pathogen#runtime_append_all_bundles()
set termguicolors
syntax on
filetype plugin indent on
colorscheme base16-eighties

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
set wildignore +=resources

set suffixesadd+=.js
set path+=src/**

let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'vendor\/'
let g:ctrlp_max_files = ''

"Shove selected lines into clipboard
vmap Y :w !xclip<CR><CR>

let g:syntastic_coffee_checkers=['coffee']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_html_tidy_ignore_errors=[
  \ 'trimming empty'
  \]
"let g:syntastic_javascript_eslint_exec='eslint_d'

let g:jsx_ext_required = 0
let g:ackprg = 'rg --vimgrep'

"let g:neomake_error_sign={'text': '❌', 'texthl': 'NeomakeErrorMsg'}
"let g:neomake_warning_sign={'text': '⚠️', 'texthl': 'NeomakeErrorMsg'}
let g:neomake_error_sign={'text': 'E', 'texthl': 'NeomakeErrorMsg'}
let g:neomake_warning_sign={'text': 'W', 'texthl': 'NeomakeErrorMsg'}
if executable('flow')
  let g:neomake_javascript_enabled_makers = ['flow']
  let g:neomake_jsx_enabled_makers = ['flow']
elseif executable('eslint_d')
  let g:neomake_javascript_enabled_makers = ['eslint_d']
  let g:neomake_jsx_enabled_makers = ['eslint_d']
elseif executable('eslint')
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_jsx_enabled_makers = ['eslint']
elseif executable('jshint')
  let g:neomake_javascript_enabled_makers = ['jshint']
  let g:neomake_jsx_enabled_makers = ['jshint']
endif

set fillchars+=vert:\ 
highlight VertSplit ctermfg=0 ctermbg=0 guifg=0 guibg=0
highlight link xmlEndTag xmlTag
highlight LineNr ctermfg=0

let g:clojure_syntax_keywords = {
    \ 'clojureMacro': ["defproject", "deftest"],
    \ }
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', '^async']

au BufRead,BufNewFile bash-fc-* set filetype=sh
au BufRead,BufNewFile COMMIT_EDITMSG setlocal spell

function! GitBranchName()
  exec ":r!git rev-parse --abbrev-ref HEAD"
endfunction
command! -nargs=0 GitBranchName call GitBranchName()
  
autocmd FileType javascript set formatprg=prettier\ --single-quote\ --trailing-comma\ es5\ --stdin"

autocmd BufWritePre *.js Neoformat
let g:neoformat_javascript_prettier = {
  \ 'exe': 'prettier',
  \ 'args': ['--single-quote', '--no-bracket-spacing', '--trailing-comma', 'es5', '--stdin'],
  \ 'stdin': 1
\ }
let g:javascript_plugin_flow = 1
