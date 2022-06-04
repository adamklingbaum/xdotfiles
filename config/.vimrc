" Install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd BufWritePre * :%s/\s\+$//e

let mapleader=","

" Fzf mapping replacing ControlP command
nnoremap <C-f> :Files<Cr>
" Fzf mapping for find in files
nnoremap <C-g> :Rg<Cr>

nnoremap <leader><space> :nohlsearch<CR>

nnoremap <Leader>m :ALEDetail<CR>

vnoremap <leader>yy "+y
noremap  <leader>pp "+p

let g:airline#extensions#tabline#enabled = 1

" ALE (lint)
" customize linter signs
let g:ale_sign_error = '●'
let g:ale_sign_warning = '•'
" only lint when leaving insert mode after an edit
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
" show error details with m[ore details]

set autoindent
set clipboard+=unnamed
set cursorline
set display+=lastline
set encoding=utf-8
set expandtab
set ignorecase
set laststatus=2
set number
set ruler
set shiftwidth=2
set softtabstop=2
set tabstop=2
set wildmenu

syntax on
filetype plugin indent on
color default

" Vim Plug: https://github.com/junegunn/vim-plug
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'vim-ruby/vim-ruby'

call plug#end()

"Fzf customization
let s:fzf_custom_opts = { 'options': '--tiebreak=end,length,index' }
