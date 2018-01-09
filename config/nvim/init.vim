set nocompatible

call plug#begin("~/.nvim/plugged")

" Colors and styles
" Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'

" Productivity
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'tpope/vim-endwise'

" Writing
Plug 'vimwiki/vimwiki'
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'

" Tagbar
Plug 'majutsushi/tagbar'

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
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
nmap <F8> :TagbarToggle<CR>

let g:tagbar_type_elixir = {
  \ 'ctagstype' : 'elixir',
  \ 'kinds' : [
      \ 'f:functions',
      \ 'functions:functions',
      \ 'c:callbacks',
      \ 'd:delegates',
      \ 'e:exceptions',
      \ 'i:implementations',
      \ 'a:macros',
      \ 'o:operators',
      \ 'm:modules',
      \ 'p:protocols',
      \ 'r:records',
      \ 't:tests'
  \ ]
  \ }

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
        \ }

 let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
    \]
\}

let g:tagbar_type_ruby = {
  \ 'kinds' : [
      \ 'm:modules',
      \ 'c:classes',
      \ 'd:describes',
      \ 'C:contexts',
      \ 'f:methods',
      \ 'F:singleton methods'
  \ ]
\ }

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
" set omnifunc=syntaxcomplete#Complete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Snippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

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
syntax enable
set background=dark
" set t_Co=256
" set term=xterm-256color
" let g:solarized_termtrans=1
" let g:solarized_termcolors=256
" let g:solarized_termcolors=16
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" colorscheme solarized
" let base16colorspace=256
colorscheme base16-solarized-dark

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

" FZF
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

map <C-p> :FZF<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>r :Tags<CR>

" Better searching
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

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

