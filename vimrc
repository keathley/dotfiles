if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible
" set shell=/bin/bash
filetype off

call plug#begin('~/.vim/plugged')

" Colors and styles
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'

" Productivity
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'mtth/scratch.vim'

" Plug 'w0rp/ale'
" Plug 'w0rp/ale', { 'for': 'rust' }
Plug 'dense-analysis/ale', { 'for': 'rust' }

" Writing
Plug 'vimwiki/vimwiki'
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'Alok/notational-fzf-vim'

" Languages and syntax
Plug 'vim-ruby/vim-ruby'
Plug 'rhysd/vim-crystal'
Plug 'elixir-lang/vim-elixir'
Plug 'fatih/vim-go'
Plug 'raichoo/haskell-vim', { 'for': 'haskell' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'b4b4r07/vim-hcl', { 'for': 'hcl' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'hwayne/tla.vim', { 'for': 'tla' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'dleonard0/pony-vim-syntax', { 'for': 'pony' }
Plug 'tpope/vim-markdown'
Plug 'wlangstroth/vim-racket'

call plug#end()

filetype on
filetype indent on
filetype plugin on

" Tabs and such
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set si
set laststatus=2

" Searching
set showmatch
set incsearch
set hlsearch
set ignorecase " make sure that both ignore and smart are set so that we use
set smartcase  " smart case sensitive searching

if has('nvim')
  set inccommand=nosplit
endif

" highlight current line
set cursorline
set cmdheight=1
set switchbuf=useopen

" Always show tab bar at the top
set showtabline=2
set winwidth=79

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" keep more context when scrolling off the end of a buffer
set scrolloff=3

" Files and backups
set autoread
set nobackup
set nowritebackup
set noswapfile
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set history=10000

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" display incomplete commands
set showcmd

" #justneckbeardthings
set list
set listchars=tab:\|\ ,trail:-

" Splits
" Ensure these open the way I'm used to
set splitbelow
set splitright

" Buffers
set hidden

" Ruler and display
set colorcolumn=80

" Copy to clipboard
if has('nvim')
  set clipboard=unnamed
endif

" Syntax highlighting and colors
syntax on
set t_Co=256
set background=dark
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE
colorscheme solarized
let g:rainbow_active = 1

" Ale
" let g:ale_linters = {'rust': ['rls']}

" Omnicomplete
set wildmode=longest,list
set wildmenu

" Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

" Normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1

" Folding
set foldmethod=manual " manual by default otherwise it can make vim slow as fuck.
set nofoldenable

" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces

" Use the old regex
set re=1

" Set tags
set tags=tags,.git/tags,.tags

" Status bar and tablines
set showtabline=2
set laststatus=2
set noshowmode " don't show this since lightline will do it for us
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'fileencoding', 'filetype' ] ]
      \ }
      \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Toggle previous buffer if we're in a crappy terminal that doesn't
" understand C-6
nnoremap gb <c-^>

" Insert a hash rocket with <c-l>
imap <c-l> \|><space>

" Make ctrl-c work correctly
imap <c-c> <esc>
nnoremap <leader><leader> <c-^>

" Remove search highlight
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Hard mode so I actually learn how to navigate in vim with hjkl
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

" Leave insert mode as quick as you can
inoremap kj <Esc>

" Resize panes
nnoremap <silent> <Up> :resize -10<CR>
nnoremap <silent> <Down> :resize +10<CR>
nnoremap <silent> <Left> :vertical resize +10<CR>
nnoremap <silent> <Right> :vertical resize -10<CR>

" augroup vimrcEx
"   autocmd BufReadPost *
"         \ if line("'\"") > 0 && line("'\"") <= line("$") |
"         \   exe "normal g`\"" |
"         \ endif
" augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Nerd Tree
map <C-\> :NERDTreeToggle<CR>

" FZF
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

nnoremap <leader>f :FZF<CR>
nnoremap <leader>r :Tags<CR>
nnoremap <leader>g :Rg<CR>

" Find command
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" Vim Pencil
augroup pencil
  autocmd!
  " autocmd FileType markdown,wiki call pencil#init()
augroup END
let g:pencil#map#suspend_af = 'K'

" Notational
let g:nv_main_directory = '~/Desktop/research/notes'
let g:nv_search_paths = ['~/Desktop/research/notes', '~/Desktop/research/diary']
" let g:nv_search_paths = ['~/Desktop/research/notes', '~/writing', '~/code', 'docs.md' , './notes.md']

" Vimwiki
let g:vimwiki_global_ext=0
let g:vimwiki_list = [
    \{'path': '~/Desktop/research/notes',
    \ 'syntax': 'markdown', 'ext': '.md'}
  \]
au BufRead,BufNewFile *.wiki set filetype=vimwiki
" :autocmd FileType vimwiki map d :VimwikiMakeDiaryNote
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
" :autocmd FileType vimwiki map c :call ToggleCalendar()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Align text
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
