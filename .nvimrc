set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-ruby/vim-ruby'
Plugin 'elixir-lang/vim-elixir'
Plugin 'nono/vim-handlebars'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-commentary'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mxw/vim-jsx'
Plugin 'fatih/vim-go'
Plugin 'wting/rust.vim'
Plugin 'raichoo/haskell-vim'
Plugin 'moll/vim-node'
Plugin 'slim-template/vim-slim'
Plugin 'christoomey/vim-tmux-navigator'

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

" #justneckbeardthings
set list
set listchars=tab:\|\ ,trail:-

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
let g:neocomplete#enable_at_startup = 1

" Splits
set splitbelow
set splitright

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
" set t_Co=256
syntax enable
set background=dark
colorscheme base16-harmonic16

" Keymappings
let mapleader=","

" Better saving
" map <C-s> :w<CR>
" inoremap <c-s> <c-o>:w<CR>
nnoremap <leader>w :w<CR>
inoremap <silent> <leader>w <c-o>:w<CR>

" Leave insert mode as quick as you can
inoremap kj <Esc>
inoremap <leader>e <Esc>

" Better spacing and shit
imap <S-CR> <c-o>O

" Panes
nmap <c-k> :wincmd k<CR>
nmap <c-j> :wincmd j<CR>
nmap <c-h> :wincmd h<CR>
nmap <c-l> :wincmd l<CR>

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("find * -type f", "", ":e")<cr>

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
"autocmd BufWritePre * :%s/\s\+$//e " Strip Trailing Whitespace

