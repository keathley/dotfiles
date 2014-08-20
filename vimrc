" Vundler stuff
set nocompatible
" filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
Plugin 'wincent/Command-T'
Plugin 'vim-ruby/vim-ruby'
Plugin 'elixir-lang/vim-elixir'
Plugin 'scrooloose/nerdtree'
Plugin 'nono/vim-handlebars'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-commentary'

let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1

call vundle#end()
filetype on
filetype indent on
filetype plugin on

" Ruler and display
set number
set ruler
set encoding=utf8
set colorcolumn=80
set relativenumber

" Indentation rules
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set ai
set si

" Files
set nobackup
set nowritebackup
set noswapfile
set history=50

" Status bar
set laststatus=2

" Omnicomplete
set omnifunc=syntaxcomplete#Complete

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch
set magic
set showmatch
set mat=2

" Make backspace not suck
set backspace=eol,start,indent
set backspace=2

" Syntax highlighting and colors
set t_Co=256
syntax enable
set background=dark
colorscheme base16-eighties

" Keymappings
let mapleader=","

" Better saving
" map <C-s> :w<CR>
" inoremap <c-s> <c-o>:w<CR>
map <leader>w :w<CR>
inoremap <leader>w <c-o>:w<CR>

" Leave insert mode as quick as you can
inoremap kj <Esc>
inoremap <leader>e <Esc>

" Better spacing and shit
imap <S-CR> <c-o>O

" Pane navigation
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" File Navigation
nnoremap <C-k><C-b> :NERDTreeToggle<CR>
nnoremap <C-t> :CommandT<CR>
nnoremap <leader>t :CommandT<CR>

" Hard mode
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

" Comment lines quickly
nmap <silent> <leader>c gcc

" Searching
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"Autocommands
autocmd BufWritePre * :%s/\s\+$//e " Strip Trailing Whitespace

