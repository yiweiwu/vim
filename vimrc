execute pathogen#infect()
syntax on
filetype indent plugin on

" Set to auto read when a file is changed from outside
set autoread

set modeline

" Hit tab in insert mode will produce the appropriate number of spaces
set expandtab

" When opening a new line,
" start the cursor at the last know indentation level
set smarttab

" Insert/Delete 4 spaces when hitting a TAB/BACKSPACE
set softtabstop=4

set shiftwidth=4
set tabstop=4

" Round indent to multiple of shiftwidth
set shiftround

"Try to be even smarter and guess the indentation rules
set autoindent

" Set you backspace key free, you can now delete the whole
" file by long pressing backspace, yeah, really.
set backspace=indent,eol,start

" Indentation for different file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType php setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Show line number
set number

" Highlight the current line
set cursorline

" Set up color scheme
set t_Co=256
set background=dark
let g:solarized_termtrans = 1
" Do not need to set this when using solarized iTerm scheme
" let g:solarized_termcolors=256
colorscheme solarized
" let g:gruvbox_termcolors=16
" let g:gruvbox_italic=0
" colorscheme jellybeans
" colorscheme gruvbox
" colorscheme distinguished
" colorscheme kolor
" colorscheme Tomorrow-Night-Bright
" colorscheme Tomorrow-Night
" colorscheme noctu
" colorscheme molokai
" colorscheme mango
" let g:hybrid_use_iTerm_colors = 1
" colorscheme hybrid
" colorscheme iceberg
" colorscheme zenburn
" colorscheme flatlandia
" colorscheme lucius
" colorscheme darcula

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Enable Ctags
set tags=tags;/

" Show vim-airline statusline all the time
set laststatus=2

" Display buffer on the top
let g:airline#extensions#tabline#enabled=1

" Use powerline font in airline
let g:airline_powerline_fonts=1
set guifont=Inconsolata\ for\ Powerline

" Set the airline theme
let g:airline_theme= "solarized"

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

" Add ctrl P
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Facebook plugins
" Enable tbgs in quickfix window
:if !empty(glob("$ADMIN_SCRIPTS/vim/biggrep.vim"))
    source $ADMIN_SCRIPTS/vim/biggrep.vim
:endif
