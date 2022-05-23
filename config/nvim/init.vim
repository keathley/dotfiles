if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible
filetype off

call plug#begin('~/.nvim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'

" Productivity
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" IDE type stuff
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'f3fora/cmp-spell'
Plug 'ryanoasis/vim-devicons'

" Writing
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'dhruvasagar/vim-table-mode'
" Plug 'godlygeek/tabular'
" Plug 'preservim/vim-markdown'
Plug 'mickael-menu/zk-nvim'

" Languages and syntax
Plug 'vim-ruby/vim-ruby'
Plug 'elixir-lang/vim-elixir'
Plug 'fatih/vim-go'
" Plug 'raichoo/haskell-vim', { 'for': 'haskell' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'b4b4r07/vim-hcl', { 'for': 'hcl' }
Plug 'hwayne/tla.vim', { 'for': 'tla' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'wlangstroth/vim-racket'
Plug 'ziglang/zig.vim'
Plug 'zah/nim.vim'

" Rust stuff
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'

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

set inccommand=nosplit

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

" Mouse Mode
set ttyfast

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
set clipboard=unnamed

" Syntax highlighting and colors
syntax on
set t_Co=256
set background=dark
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE
colorscheme solarized
let g:rainbow_active = 1

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

" Insert a pipe with ctrl-l
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Nerd Tree
map <C-\> :NERDTreeToggle<CR>
nnoremap <silent> <leader>nf :NERDTreeFind<CR>

" FZF
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

nnoremap <leader>f :FZF<CR>
nnoremap <leader>r :Tags<CR>
nnoremap <leader>g :Rg<CR>

" let g:fzf_layout = { 'down': '30%' }
" let g:fzf_colors =
"     \ { 'fg':      ['fg', 'Normal'],
"       \ 'bg':      ['bg', 'Normal'],
"       \ 'hl':      ['fg', 'Comment'],
"       \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"       \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"       \ 'hl+':     ['fg', 'Statement'],
"       \ 'info':    ['fg', 'PreProc'],
"       \ 'border':  ['fg', 'Ignore'],
"       \ 'prompt':  ['fg', 'Conditional'],
"       \ 'pointer': ['fg', 'Exception'],
"       \ 'marker':  ['fg', 'Keyword'],
"       \ 'spinner': ['fg', 'Label'],
"       \ 'header':  ['fg', 'Comment'] }

" Find command
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" Markdown
let g:vim_markdown_frontmatter = 1

" Vim Pencil
augroup pencil
  autocmd!
  " autocmd FileType markdown,wiki call pencil#init()
augroup END
let g:pencil#map#suspend_af = 'K'

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


" Table Mode
let g:table_mode_corner='|'
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" Terminal mode nonsense
" tnoremap <Esc> <C-\><C-n>
" tnoremap <M-[> <Esc>
" tnoremap <C-v><Esc> <Esc>

" " Terminal mode:
" tnoremap <M-h> <c-\><c-n><c-w>h
" tnoremap <M-j> <c-\><c-n><c-w>j
" tnoremap <M-k> <c-\><c-n><c-w>k
" tnoremap <M-l> <c-\><c-n><c-w>l
" " Insert mode:
" inoremap <M-h> <Esc><c-w>h
" inoremap <M-j> <Esc><c-w>j
" inoremap <M-k> <Esc><c-w>k
" inoremap <M-l> <Esc><c-w>l
" " Visual mode:
" vnoremap <M-h> <Esc><c-w>h
" vnoremap <M-j> <Esc><c-w>j
" vnoremap <M-k> <Esc><c-w>k
" vnoremap <M-l> <Esc><c-w>l
" " Normal mode:
" nnoremap <M-h> <c-w>h
" nnoremap <M-j> <c-w>j
" nnoremap <M-k> <c-w>k
" nnoremap <M-l> <c-w>l

" for nvim-completion
set completeopt=menuone,noinsert,noselect
set shortmess+=c

" Setup the builtin LS client.
" You can read more about it here: https://neovim.discourse.group/t/how-to-use-and-contribute-to-neovims-built-in-language-server-client-and-nvim-lspconfig/30
"
" " Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
" set updatetime=300
" Show diagnostic popup on cursor hold
" autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
" set signcolumn=yes

" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

lua <<EOF
local nvim_lsp = require("lspconfig")

vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "dt", "<cmd>lua vim.lsp.buf.definition()<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "K",  "<cmd>lua vim.lsp.buf.hover()<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", {noremap = true, silent = true})

require('rust-tools').setup({
  tools = { -- rust-tools options
    autoSetHints = true,
    hover_with_actions = true,
    inlay_hints = {
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attaches to the buffer
    on_attach = function(_, bufnr)
      -- mouse if it doesn't fit in the floating window
      vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<cr>", {noremap = true, silent = true})
    end,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy"
        },
      }
    }
  },
})

-- Ruby LSP support
nvim_lsp.solargraph.setup({
  settings = {
    solargraph = {
      diagnostics = false,
    }
  }
})

-- nvim_lsp.zls.setup({
--   cmd = { "~/zls/zls" }
-- })

-- You'll need to install the LS somewhere and you can set the path here.
-- I use the cache dir because the lspconfig plugin used to have auto installers
-- but they removed it because it was too much maintenance.
-- It should be as easy as cloning and running these instructions
-- https://github.com/elixir-lsp/elixir-ls#building-and-running
local path_to_elixirls = vim.fn.expand("~/.elixir-ls/language_server.sh")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

nvim_lsp.elixirls.setup({
  on_attach = function(_, bufnr)
    -- Shows documentation for the given function or module. You should be able to scroll with the
    -- mouse if it doesn't fit in the floating window
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<cr>", {noremap = true, silent = true})
  end,
  settings = {
    elixirLS = {
      -- Turn off dialyzer. This disables some LS features, I think workspace symbols
      dialyzerEnabled = false,
      -- Turn off automatic dep fetching. Sometimes it get's stuck, easier to just run it myself. They might be making the default `false` soon.
      fetchDeps = false
    }
  },
  cmd = {path_to_elixirls},
  capabilities = capabilities,
})

-- require("zk").setup({
--   picker = "fzf",
-- })

-- ZK Setup
-- nvim_lsp.zk.setup({
--   on_attach = function(_, bufnr)
--     vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<cr>", {noremap = true, silent = true})
--   end,
--   capabilities = capabilities,
-- })

vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

local cmp = require('cmp')
cmp.setup({
  -- Enable LSP Snippets
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'nvim_lua' },
    { name = 'buffer', keyword_length = 5 },
    { name = 'path' },
    { name = 'spell', keyword_length = 6 },
  },
})
EOF
