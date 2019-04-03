call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using git URL
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plugin options
Plug 'nsf/gocode', { 'tag': 'go.weekly.2012-03-13', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Color Scheme
Plug 'morhetz/gruvbox'
Plug 'https://github.com/benjaminwhite/Benokai.git'

"AirLine
Plug 'https://github.com/bling/vim-airline'

"NerdTree
Plug 'scrooloose/nerdtree'

"CoffeeScript
Plug 'kchmck/vim-coffee-script'

" BufferLine
Plug 'https://github.com/bling/vim-bufferline'

"NerdTree Tabs
Plug 'jistr/vim-nerdtree-tabs'

" CTRL+P
Plug 'https://github.com/kien/ctrlp.vim.git'

"Scala
Plug 'derekwyatt/vim-scala'

" Endwise
Plug 'tpope/vim-endwise'
"Rust
Plug 'wting/rust.vim'
Plug 'terryma/vim-multiple-cursors'

call plug#end()

"Open Nerdtree if we open directory
if isdirectory(argv(0))
	bd
	autocmd vimenter * exe "cd" argv(0)
	autocmd VimEnter * NERDTree
endif

" Tabs
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set cursorline
set bg=dark
set number
set nowrap
set autoread
set mouse=n
set listchars+=eol:¬
set list

" gruvbox dark option
let g:gruvbox_contrast_dark='hard'

"Map HJKL
:map! <C-h> <left>
:map! <C-j> <down>
:map! <C-k> <up>
:map! <C-l> <right>

colorscheme gruvbox

if has("gui_running")
  set guioptions-=T  "remove toolbar 
  set lines=40 columns=130
endif
