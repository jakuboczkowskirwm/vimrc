execute pathogen#infect()

call plug#begin('~/.vim/plugged')

" onedark colorschmea
Plug 'joshdick/onedark.vim'

"one colorschema
Plug 'rakr/vim-one'

" github colorschmea
Plug 'endel/vim-github-colorscheme'

" snippets
Plug 'honza/vim-snippets'

" JS syntax
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'kaicataldo/material.vim'
Plug 'morhetz/gruvbox'
Plug 'franbach/miramare'

Plug 'christoomey/vim-tmux-navigator'

" JS coc
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Nerd TREE
Plug 'scrooloose/nerdtree'

" Ruby vim plugin
Plug 'vim-ruby/vim-ruby'

" Rails vim plugin
Plug 'tpope/vim-rails'

" RuboCop
Plug 'ngmy/vim-rubocop'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-rake'

" Show git diffs in file
Plug 'airblade/vim-gitgutter'

" Git wrapper
Plug 'tpope/vim-fugitive'

"AirLine
Plug 'https://github.com/bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Poweline
Plug 'powerline/powerline'

"CoffeeScript
Plug 'kchmck/vim-coffee-script'

" BufferLine
Plug 'https://github.com/bling/vim-bufferline'

" Endwise
Plug 'tpope/vim-endwise'

" Comments
Plug 'scrooloose/nerdcommenter'

" Closing html tags
Plug 'alvan/vim-closetag'

" Command runner
Plug 'benmills/vimux'

" Synteach linter
Plug 'w0rp/ale'

" Colsing word betwen bractes etc..
Plug 'tpope/vim-surround'

" Autocompletion
Plug 'ervandew/supertab'

call plug#end()

" Ale configuration
let g:ale_linters = {
 \ 'javascript': ['eslint', 'prettier'],
 \ 'ruby': ['rubocop']
 \ }

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['eslint', 'prettier'],
      \ 'ruby': ['rubocop', 'prettier'],
      \}

let g:ale_enabled = 1
let g:ale_fix_on_save = 0

let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

let g:ale_set_highlights = 1

autocmd CursorHold * call ale#Queue(0)
autocmd CursorHoldI * call ale#Queue(0)
autocmd InsertLeave * call ale#Queue(0)
autocmd TextChanged * call ale#Queue(0)

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 1

hi ALEWarning ctermbg=94

set number
set relativenumber
set noswapfile
set list listchars=tab:»·,trail:·,nbsp:·
set background=dark
colorscheme onedark
" colorscheme one
set statusline+=%F
set hidden
set smarttab
set shiftwidth=2
set tabstop=2
set expandtab
set colorcolumn=80
set hlsearch
set noesckeys
highlight ColorColumn ctermbg=0 guibg=#424242
highlight LineNr guifg=#aaaaaa

let mapleader = ' '
" Find selected text in file.
vnoremap // y/<C-R>"<CR>
nnoremap <Leader>f yiw/<C-R>"<CR>

" Finding in folders
nnoremap <Leader>ga :Files app/<CR>
nnoremap <Leader>gm :Files app/models/<CR>
nnoremap <Leader>gc :Files app/controllers/<CR>
nnoremap <Leader>gj :Files app/javascript/<CR>
nnoremap <Leader>gv :Files app/views/<CR>
nnoremap <Leader>gs :Files spec/<CR>
nnoremap <Leader>gd :FZF<CR>
nnoremap <Leader>gg :GFiles?<CR>
" Finding in files
nnoremap \ :Ag<SPACE>
nnoremap <leader>k :exe 'Ag!' expand('<cword>')<cr>
vnoremap <leader>j "zy :Ag <C-R>z<cr>
nnoremap <leader>\ :vsplit<cr>

let g:spec_runner_dispatcher = "VtrSendCommand! bundle exec {command}"

nnoremap <Leader>s :call VimuxRunCommand("clear; be rspec " . bufname("%"))<CR>
" Run rubocop for current file.
nnoremap <Leader>l :call VimuxRunCommand("clear; rubocop " . bufname("%"))<CR>

" Switch betwen two last files
nnoremap <leader><leader> <C-^>
" Switch to next buffer
nnoremap <leader>n :bn<Enter>
" Show all buffers
nnoremap <leader>a :Buffers<CR>
" Switch buffer number
nnoremap <C-q> :Buffers<CR>


function! VimuxSlime()
  call VimuxRunCommand(@v, 0)
endfunction


vmap <Leader>vs "vy :call VimuxSlime()<CR>
" Diffrent currsors in diffrent mode.
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" Search and replace
vnoremap <F8> "xy :%s/<C-R>x/
" Toogle nerd tree
nmap <F7> :NERDTreeToggle<CR>
" Snippets
nnoremap gb obinding.pry<esc>
nnoremap gc oconsole.log(

" let g:ale_sign_error = ''
" let g:ale_sign_warning = ''

" Function to hide and show left tab.
function! HideTab()
  set nonumber
  set norelativenumber
  set signcolumn=no
endfunction
function! ShowTab()
  set number
  set relativenumber
  set signcolumn=yes
endfunction

nnoremap <F2> :saveas %:p:h/
nnoremap <F9> :call HideTab()<cr>
nnoremap <F10> :call ShowTab()<cr>

if (has("termguicolors"))
  set termguicolors
endif


autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F12>     :ShowSpaces 1<CR>
nnoremap <S-F12>   m`:TrimSpaces<CR>``
vnoremap <S-F12>   :TrimSpaces<CR>


function StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
