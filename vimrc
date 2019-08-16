execute pathogen#infect()

call plug#begin('~/.vim/plugged')
" jssyntax
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

" Git gutter
Plug 'airblade/vim-gitgutter'

"AirLine
Plug 'https://github.com/bling/vim-airline'

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

call plug#end()

set number
set relativenumber
set t_Co=256
set noswapfile
set list listchars=tab:»·,trail:·,nbsp:·
set background=dark
colorscheme material
set termguicolors
let g:material_theme_style = 'darker'

let mapleader = ' '
vnoremap // y/<C-R>"<CR>

nnoremap <C-q> :Buffers<CR>
nnoremap <Leader>ga :Files app/<CR>
nnoremap <Leader>gm :Files app/models/<CR>
nnoremap <Leader>gc :Files app/controllers/<CR>
nnoremap <Leader>gj :Files app/javascript/<CR>
nnoremap <Leader>gv :Files app/views/<CR>
nnoremap <Leader>gs :Files spec/<CR>
nnoremap \ :Ag<SPACE>

let g:spec_runner_dispatcher = "VtrSendCommand! bundle exec {command}"

nnoremap <Leader>s :call VimuxRunCommand("clear; be rspec " . bufname("%"))<CR>
nnoremap <Leader>l :call VimuxRunCommand("clear; rubocop " . bufname("%"))<CR>

" Switch betwen two last files
nnoremap <leader><leader> <C-^>
" Switch to next buffer
nnoremap <leader>n :bn<Enter>
" Show all buffers
nnoremap <leader>a :buffers<CR>:buffer<Space>

set smarttab
set shiftwidth=2
set tabstop=2
set expandtab

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

let g:ale_linters = {
 \ 'javascript': ['eslint', 'prettier'],
 \ 'ruby': ['rubocop']
 \ }

nmap <silent> [e <Plug>(ale_previous_wrap)
nmap <silent> ]e <Plug>(ale_next_wrap)

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

set updatetime=1000

autocmd CursorHold * call ale#Queue(0)
autocmd CursorHoldI * call ale#Queue(0)
autocmd InsertLeave * call ale#Queue(0)
autocmd TextChanged * call ale#Queue(0)

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 1

command AleFixToggle :call AleFixToggle()
map <silent> <F8> :AleFixToggle<cr>

function! AleFixToggle()
  if g:ale_fix_on_save
  let g:ale_fix_on_save = 0
  :echo 'Ale Fixing on save disabled'
  else
  let g:ale_fix_on_save = 1
  :echo 'Ale Fixing on save enabled'
  endif
endfunction

hi ALEWarning ctermbg=94
nnoremap <leader>k :exe 'Ag!' expand('<cword>')<cr>


augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END
