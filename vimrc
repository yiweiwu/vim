execute pathogen#infect()
syntax on
filetype indent plugin on

set modeline
" Don't use the tab character, convert them to spaces
set expandtab

" Insert/Delete 4 spaces when hitting a TAB/BACKSPACE
set softtabstop=4

" When opening a new line, start the cursor at the last know indentation level
" In Python, the indentation is part of the language
set smarttab

" A tab is 4 space wide
set shiftwidth=4
set tabstop=4

" Round indent to multiple of shiftwidth
set shiftround

"Try to be even smarter and guess the indentation rules
set autoindent

" Set you backspace key free, you can now delete the whole
" file by long pressing backspace, yeah, really.
set backspace=indent,eol,start

" Show line number
set number

" Highlight the current line
set cursorline

" Set up color scheme
set t_Co=256
set background=dark
" let g:solarized_termcolors=256
" let g:solarized_termtrans = 1
" colorscheme solarized
" let g:gruvbox_termcolors=16
" let g:gruvbox_italic=0
" colorscheme jellybeans
" colorscheme gruvbox
" colorscheme distinguished
" colorscheme kolor
colorscheme Tomorrow-Night-Bright
" colorscheme noctu
" colorscheme molokai

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Enable Ctags
set tags+=~/src/beautifulmind/tags

" Show vim-airline statusline all the time
set laststatus=2

" Display buffer on the top
let g:airline#extensions#tabline#enabled=1

" Use powerline font in airline
let g:airline_powerline_fonts=1
set guifont=Inconsolata\ for\ Powerline

" Set the airline theme
let g:airline_theme='tomorrow'

" Move down/up a single row on the screen
:nmap j gj
:nmap k gk

" Config search
" ignorecase and smartcase make searches case-insensitive except you include
" upper-case characters
set incsearch
set ignorecase
set smartcase
" Highlight the current search
set hlsearch
" Clear highlight
:nmap \q :nohlsearch<CR>
