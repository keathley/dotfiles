set nocompatible

call plug#begin("~/.nvim/plugged")

" Colors and styles
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'

" Productivity
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

" Writing
Plug 'vimwiki/vimwiki'
Plug 'reedes/vim-pencil'

" Languages and syntax
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-markdown'
Plug 'vim-ruby/vim-ruby'
Plug 'elixir-lang/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'mxw/vim-jsx'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'raichoo/haskell-vim'
Plug 'moll/vim-node'
Plug 'slim-template/vim-slim'
Plug 'elzr/vim-json'
Plug 'elmcast/elm-vim'
Plug 'dag/vim-fish'
Plug 'b4b4r07/vim-hcl'

call plug#end()

filetype on
filetype indent on
filetype plugin on

set hidden

" Ruler and display
set ruler
set cursorline
set cmdheight=1
set encoding=utf8
set colorcolumn=80

" Highlight commands
set inccommand=nosplit

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

" Tags
set tags=tags,.git/tags,.tags

" Files
set nobackup
set nowritebackup
set noswapfile
set history=50

" Copy to clipboard
set clipboard+=unnamedplus

" Autocomplete / Omnicomplete
set wildmode=longest,list
set wildmenu

" Editing stuff
set autoread

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

set t_ti= t_te=
set scrolloff=3

" Make backspace not suck
set backspace=eol,start,indent
set backspace=2

" Syntax highlighting and colors
syntax enable
set t_Co=256
set background=dark
colorscheme solarized

" Status bar
set showtabline=2
set winwidth=79
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

" Keymappings
let mapleader=","

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Core
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leave insert mode as quick as you can
inoremap kj <Esc>

" Panes
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>

nnoremap <silent> <Up> :resize -10<CR>
nnoremap <silent> <Down> :resize +10<CR>
nnoremap <silent> <Left> :vertical resize +10<CR>
nnoremap <silent> <Right> :vertical resize -10<CR>

" FZF
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

map <C-p> :FZF<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>r :Tags<CR>

" Better searching
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" NerdTree
map <C-\> :NERDTreeToggle<CR>

" Hard mode
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

" Searching
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Align Plugin
command! -nargs=? -range Align <line1>,<line2>call AlignSection('<args>')
vnoremap <silent> <Leader>a :Align<CR>
function! AlignSection(regex) range
  let extra = 1
  let sep = empty(a:regex) ? '=' : a:regex
  let maxpos = 0
  let section = getline(a:firstline, a:lastline)
  for line in section
    let pos = match(line, ' *'.sep)
    if maxpos < pos
      let maxpos = pos
    endif
  endfor
  call map(section, 'AlignLine(v:val, sep, maxpos, extra)')
  call setline(a:firstline, section)
endfunction

function! AlignLine(line, sep, maxpos, extra)
  let m = matchlist(a:line, '\(.\{-}\) \{-}\('.a:sep.'.*\)')
  if empty(m)
    return a:line
  endif
  let spaces = repeat(' ', a:maxpos - strlen(m[1]) + a:extra)
  return m[1] . spaces . m[2]
endfunction

" Terminal mode nonsense

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>

  " Terminal mode:
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
  " Insert mode:
  inoremap <M-h> <Esc><c-w>h
  inoremap <M-j> <Esc><c-w>j
  inoremap <M-k> <Esc><c-w>k
  inoremap <M-l> <Esc><c-w>l
  " Visual mode:
  vnoremap <M-h> <Esc><c-w>h
  vnoremap <M-j> <Esc><c-w>j
  vnoremap <M-k> <Esc><c-w>k
  vnoremap <M-l> <Esc><c-w>l
  " Normal mode:
  nnoremap <M-h> <c-w>h
  nnoremap <M-j> <c-w>j
  nnoremap <M-k> <c-w>k
  nnoremap <M-l> <c-w>l
endif

" Vim Pencil
augroup pencil
  autocmd!
  autocmd FileType markdown,wiki call pencil#init()
augroup END

