set nocompatible
set shell=/bin/bash
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Colors and styles
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'itchyny/lightline.vim'

" Productivity
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'vimwiki/vimwiki'

Plugin 'reedes/vim-pencil'
Plugin 'scrooloose/nerdtree'

" Languages and syntax
Plugin 'tpope/vim-cucumber'
Plugin 'vim-ruby/vim-ruby'
Plugin 'elixir-lang/vim-elixir'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mxw/vim-jsx'
Plugin 'fatih/vim-go'
Plugin 'raichoo/haskell-vim'
Plugin 'moll/vim-node'
Plugin 'slim-template/vim-slim'
Plugin 'elzr/vim-json'
Plugin 'elmcast/elm-vim'
Plugin 'dag/vim-fish'
Plugin 'b4b4r07/vim-hcl'

Plugin 'rust-lang/rust.vim'

call vundle#end()
filetype on
filetype indent on
filetype plugin on

set hidden
set history=10000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set cursorline
set cmdheight=1
set switchbuf=useopen
" Always show tab bar at the top
set showtabline=2
set winwidth=79
" This makes RVM work inside Vim. I have no idea why.
set shell=bash
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
" keep more context when scrolling off the end of a buffer
set scrolloff=3
" Don't make backups at all
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" display incomplete commands
set showcmd
" Enable highlighting for syntax
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
let mapleader=","
" Fix slow O inserts
:set timeout timeoutlen=1000 ttimeoutlen=100
" Normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1
" Modelines (comments that set vim options on a per-file basis)
set modeline
set modelines=3
" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable
" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces
" If a file is changed outside of vim, automatically reload it without asking
set autoread
" Use the old vim regex engine (version 1, as opposed to version 2, which was
" introduced in Vim 7.3.969). The Ruby syntax highlighting is significantly
" slower with the new regex engine.
set re=1

:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>y "*y
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>
" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>
nnoremap <leader><leader> <c-^>
" Reload in chrome
map <leader>l :w\|:silent !reload-chrome<cr>
" Align selected lines
vnoremap <leader>ib :!align<cr>
map <C-\> :NERDTreeToggle<CR>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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

" Ruler and display
" set number
"set ruler
"set encoding=utf8
set colorcolumn=80

"" #justneckbeardthings
"set list
"set listchars=tab:\|\ ,trail:-

"" Indentation rules
"set expandtab
"set smarttab
"set shiftwidth=2
"set softtabstop=2
"set ai
"set si

"" Files
"set nobackup
"set nowritebackup
"set noswapfile
"set history=50

"" Copy to clipboard
"" set clipboard=unnamed

"" Omnicomplete
"set wildmode=longest,list
"set wildmenu

"" Editing stuff
"set autoread

"" Splits
set splitbelow
set splitright

"" Searching
"set ignorecase
"set smartcase
"set incsearch
"set hlsearch
"set magic
"set showmatch
"set mat=2

"" Make backspace not suck
"set backspace=eol,start,indent
"set backspace=2

"" Syntax highlighting and colors
" syntax enable
set t_Co=256
set background=dark
colorscheme solarized

"" Status bar
"" set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
"set showtabline=2
"set laststatus=2
"set noshowmode
"let g:lightline = {
"      \ 'colorscheme': 'solarized',
"      \ }

"" Keymappings
"let mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Rails
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:rspec_runner = "os_x_iterm2"
"let g:rspec_command = "!bin/rspec {spec}"
"map <leader>s :call RunCurrentSpecFile()<CR>
"map <leader>vs :AV<CR>
"map <leader>va :AV<CR>
"map <leader>vr :RV<CR>
"map <leader>cs <c-w><c-d>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Javascript
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:vim_json_syntax_conceal = 0
"let g:jsx_ext_required = 0 " Use new syntax in js files


""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Git stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <leader>gb :Gblame<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Go
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_structs = 1
"let g:go_fmt_command = "goimports"
"au FileType go nmap <leader>s :GoTest<CR>
"au FileType go nmap <leader>b :GoBuild<CR>
"au FileType go nmap <leader>va :GoDefVertical<CR>
"au FileType go nmap <Leader>e :GoRename<CR>
"au FileType go nmap <leader>dv :<C-u>call go#def#JumpMode("vsplit")<CR>
"" autocmd BufWritePost,FileWritePost *.go execute 'GoLint' | cwindow
""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Rust
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if executable('rls')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'rls',
"        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
"        \ 'whitelist': ['rust'],
"        \ })
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Core
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Better saving
"" map <C-s> :w<CR>
"" inoremap <c-s> <c-o>:w<CR>
"nnoremap <leader>w :w<CR>
"inoremap <silent> <leader>w <c-o>:w<CR>

"" Leave insert mode as quick as you can
inoremap kj <Esc>

"" Better spacing and shit
"imap <S-CR> <c-o>O

"" Insert new lines
"" nmap <S-CR> O<Esc>
"" nmap <CR> o<Esc>
"map <leader>sr :%s//

"" Panes
"nnoremap <silent> <c-k> :wincmd k<CR>
"nnoremap <silent> <c-j> :wincmd j<CR>
"nnoremap <silent> <c-h> :wincmd h<CR>
"nnoremap <silent> <c-l> :wincmd l<CR>

nnoremap <silent> <Up> :resize -10<CR>
nnoremap <silent> <Down> :resize +10<CR>
nnoremap <silent> <Left> :vertical resize +10<CR>
nnoremap <silent> <Right> :vertical resize -10<CR>

"" File Searching
"function! SelectaCommand(choice_command, selecta_args, vim_command)
"  try
"    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
"  catch /Vim:Interrupt/
"    redraw!
"    return
"  endtry
"  redraw!
"  exec a:vim_command . " " . selection
"endfunction

"" FZF
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

nnoremap <leader>f :FZF<CR>

"" --column: Show column number
"" --line-number: Show line number
"" --no-heading: Do not show file headings in results
"" --fixed-strings: Search term as a literal string
"" --ignore-case: Case insensitive search
"" --no-ignore: Do not respect .gitignore, etc...
"" --hidden: Search hidden files and folders
"" --follow: Follow symlinks
"" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
"" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

"" nnoremap <leader>f :call SelectaCommand("git ls-files", "", ":e")<cr>
"" nnoremap <leader>t :call SelectaCommand("git ls-files", "", ":tabe")<cr>
"" nnoremap <leader>v :call SelectaCommand("git ls-files", "", ":vsp")<cr>
"" au FileType javascript nnoremap <leader>f :call SelectaCommand("find * -type d -name node_modules -prune -o -print", "", ":e")<cr>
"" au FileType javascript nnoremap <leader>t :call SelectaCommand("find * -type d -name node_modules -prune -o -print", "", ":tabe")<cr>
"" au FileType javascript nnoremap <leader>v :call SelectaCommand("find * -type d -name node_modules -prune -o -print", "", ":vsp")<cr>

"" Hard mode
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

"" Comment lines quickly
" nmap <silent> <leader>c gcc

"" Searching
"nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
"nnoremap gr :grep <cword> **/*(.)<cr>`

""Autocommands
"autocmd BufWritePre * :%s/\s\+$//e " Strip Trailing Whitespace

