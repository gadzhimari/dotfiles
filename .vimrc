set nocompatible

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" colorschemes
Plug 'nanotech/jellybeans.vim'

" General
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
Plug 'tpope/vim-endwise' " automatically add end in ruby
Plug 'tpope/vim-fugitive' " git wrapper for vim
Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - ehances surround
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'tpope/vim-sensible' " a universal set of defaults that (hopefully) everyone can agree on
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands

" Advanced
Plug 'w0rp/ale'
Plug 'Shougo/vimproc.vim'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'

" Autocomplete
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'

" Search and navigation
Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'moll/vim-node'

" PHP
Plug '2072/PHP-Indenting-for-VIm'
Plug 'shawncplus/phpcomplete.vim'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'eagletmt/ghcmod-vim'

" Clojure
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-leiningen'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace'
Plug 'venantius/vim-eastwood'
Plug 'vim-scripts/paredit.vim'

" Racket
Plug 'wlangstroth/vim-racket'

" OCaml
Plug 'rgrinberg/vim-ocaml'

" HTML
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-haml'
Plug 'digitaltoad/vim-pug'
Plug 'Valloric/MatchTagAlways'

" language-specific plugins
Plug 'elzr/vim-json'
Plug 'stephpy/vim-yaml'
Plug 'plasticboy/vim-markdown'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

let mapleader = "\<Space>"

" Unmap the arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>

" Sets how many lines of history VIM has to remember
set history=1000

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Enhanced command completion
set wildmenu

" Ignore following files when completing file/directory names
set wildignore+=.hg,.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.sw?
set wildignore+=*.DS_Store

" Lines of text around cursor
set scrolloff=5

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

set visualbell

if has('mouse')
  set mouse=a
endif

" Don't redraw while executing macros (good performance config)
set lazyredraw
" Faster redrawing
set ttyfast

set cursorline
" Current buffer can be put into background
set hidden
set nofoldenable
set wrap
set linebreak

set number
set relativenumber

set title

" Searching
set gdefault
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set nowb
set noswapfile

" Display incomplete commands
set showcmd

" Automatically :write before running commands
set autowrite

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" Use one space, not two, after punctuation.
set nojoinspaces

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set background=dark
set cmdheight=2
set t_Co=256
colorscheme jellybeans

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

let g:airline#extensions#ale#enabled = 1

let g:ale_completion_enabled = 1
let g:ale_linters = {
\  'javascript': ['eslint', 'flow'],
\}

" upper/lower word
nmap <Leader>u mQviwU`Q
nmap <Leader>l mQviwu`Q

nmap <Leader>w :w<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Allows to copy/paste between VIM instances
" "copy the current visual selection to ~/.vbuf
vmap <Leader>y :w! ~/.vbuf<CR>
" "copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! ~/.vbuf<CR>
" "paste the contents of the buffer file
nmap <Leader>p :r ~/.vbuf<CR>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
nnoremap <silent> <bs> <C-w><Left>

" FZF (replaces Ctrl-P, FuzzyFinder and Command-T)
" Including hidden files in search
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

nmap <Leader>o :Files<CR>
nmap <Leader>r :Tags<CR>

" Mapping selecting mappings
nmap <Leader><tab> <plug>(fzf-maps-n)
xmap <Leader><tab> <plug>(fzf-maps-x)
omap <Leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Quickly edit/reload the vimrc file
map <leader>vl :vsp $MYVIMRC<CR>
map <leader>vr :source $MYVIMRC<CR>

nmap <silent> // :nohlsearch<CR>

let NERDTreeIgnore = ['\.pyc$', '\.retry$']
nmap <C-i> :NERDTreeFind<CR>
nmap <Leader><Leader> :NERDTreeToggle<CR>
nmap <F5> :UndotreeToggle<CR>

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'ag --vimgrep'
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>A :Ack! '\b<c-r><c-w>\b'<cr>
