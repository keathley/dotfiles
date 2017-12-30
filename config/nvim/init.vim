set nocompatible
set shell=/bin/bash

call plug#begin("~/.nvim/plugged")

" Colors and styles
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'

" Productivity
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
" Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'

" Languages and syntax
Plug 'tpope/vim-cucumber'
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

" Elixir Fanciness
Plug 'slashmili/alchemist.vim'

call plug#end()

filetype on
filetype indent on
filetype plugin on

" Ruler and display
" set number
set ruler
set encoding=utf8
set colorcolumn=80

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

" Copy to clipboard
" set clipboard=unnamed

" Autocomplete / Omnicomplete
set wildmode=longest,list
set wildmenu
" set omnifunc=syntaxcomplete#Complete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Autopairs
let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', 'do':'end'}

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

" Make backspace not suck
set backspace=eol,start,indent
set backspace=2

" Syntax highlighting and colors
set t_Co=256
syntax enable
set background=dark
colorscheme solarized

" Status bar
" set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
set showtabline=2
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

" Keymappings
let mapleader=","

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Rails
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rspec_runner = "os_x_iterm2"
let g:rspec_command = "!bin/rspec {spec}"
map <leader>s :call RunCurrentSpecFile()<CR>
map <leader>vs :AV<CR>
map <leader>va :AV<CR>
map <leader>vr :RV<CR>
map <leader>cs <c-w><c-d>

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_json_syntax_conceal = 0
let g:jsx_ext_required = 0 " Use new syntax in js files


"""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Git stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gb :Gblame<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Go
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_fmt_command = "goimports"
au FileType go nmap <leader>s :GoTest<CR>
au FileType go nmap <leader>b :GoBuild<CR>
au FileType go nmap <leader>va :GoDefVertical<CR>
au FileType go nmap <Leader>e :GoRename<CR>
au FileType go nmap <leader>dv :<C-u>call go#def#JumpMode("vsplit")<CR>
" autocmd BufWritePost,FileWritePost *.go execute 'GoLint' | cwindow

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Core
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Better saving
" map <C-s> :w<CR>
" inoremap <c-s> <c-o>:w<CR>
nnoremap <leader>w :w<CR>
inoremap <silent> <leader>w <c-o>:w<CR>

" Leave insert mode as quick as you can
inoremap kj <Esc>

" Better spacing and shit
imap <S-CR> <c-o>O

" Insert new lines
" nmap <S-CR> O<Esc>
" nmap <CR> o<Esc>
map <leader>sr :%s//

" Panes
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>

nnoremap <silent> <Up> :resize -10<CR>
nnoremap <silent> <Down> :resize +10<CR>
nnoremap <silent> <Left> :vertical resize +10<CR>
nnoremap <silent> <Right> :vertical resize -10<CR>

" File Searching
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" FZF
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

map <C-p> :FZF<CR>
nnoremap <leader>f :FZF<CR>

" Better searching
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" NerdTree
map <C-\> :NERDTreeToggle<CR>

" Ale
let g:ale_rust_cargo_check_all_targets = 0

" nnoremap <leader>f :call SelectaCommand("git ls-files", "", ":e")<cr>
" nnoremap <leader>t :call SelectaCommand("git ls-files", "", ":tabe")<cr>
" nnoremap <leader>v :call SelectaCommand("git ls-files", "", ":vsp")<cr>
" au FileType javascript nnoremap <leader>f :call SelectaCommand("find * -type d -name node_modules -prune -o -print", "", ":e")<cr>
" au FileType javascript nnoremap <leader>t :call SelectaCommand("find * -type d -name node_modules -prune -o -print", "", ":tabe")<cr>
" au FileType javascript nnoremap <leader>v :call SelectaCommand("find * -type d -name node_modules -prune -o -print", "", ":vsp")<cr>

" Hard mode
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

" Comment lines quickly
" nmap <silent> <leader>c gcc

" Searching
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
nnoremap gr :grep <cword> **/*(.)<cr>`

"Autocommands
"autocmd BufWritePre * :%s/\s\+$//e " Strip Trailing Whitespace

