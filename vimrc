execute pathogen#infect()

call plug#begin('~/.vim/plugged')

" JS syntax
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'kaicataldo/material.vim'

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
set t_Co=256
set noswapfile
set list listchars=tab:»·,trail:·,nbsp:·
colorscheme material
set statusline+=%F
set hidden
set smarttab
set shiftwidth=2
set tabstop=2
set expandtab
set colorcolumn=80
set termguicolors
set hlsearch
highlight ColorColumn ctermbg=0 guibg=#424242

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
" Finding in files
nnoremap \ :Ag<SPACE>
nnoremap <leader>k :exe 'Ag!' expand('<cword>')<cr>
vnoremap <leader>j "zy :Ag <C-R>z<cr>

let g:spec_runner_dispatcher = "VtrSendCommand! bundle exec {command}"

" Run rspec for current spec file.
nnoremap <Leader>s :call VimuxRunCommand("clear; be rspec " . bufname("%"))<CR>
" Run rubocop for current file.
nnoremap <Leader>l :call VimuxRunCommand("clear; rubocop " . bufname("%"))<CR>
" Switch betwen two last files
nnoremap <leader><leader> <C-^>
" Switch to next buffer
nnoremap <leader>n :bn<Enter>
" Show all buffers
nnoremap <leader>a :buffers<CR>:buffer<Space>
" Switch buffer number
nnoremap <C-q> :Buffers<CR>

" Diffrent currsors in diffrent mode.
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" Search and replace
vnoremap <F8> "xy :%s/<C-R>x/


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
nnoremap <F9> :call HideTab()<cr>
nnoremap <F10> :call ShowTab()<cr>

