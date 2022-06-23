if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

set autoindent
set tabstop=2
set shiftwidth=2
set number
set ruler
set hlsearch
set ignorecase smartcase
set incsearch
set shiftround

syntax on
filetype plugin indent on

let g:ale_sign_error = '●'
let g:ale_sign_warning = '•'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#tabline#enabled = 1
let g:jellybeans_use_term_italics = 1
let g:jellybeans_use_lowcolor_black = 1

let mapleader = ","

" Ripgrep stuff
noremap  <leader>,    :Files<cr>
noremap  <leader>fw   :Rg <C-r><C-w>

" No highlight
noremap  <leader>nh   :nohl<cr>

" Copy and paste clipboard
vnoremap <leader>yy   "+y
noremap  <leader>pp   "+p

colorscheme dracula
highlight Normal ctermbg=None
autocmd VimResized * :wincmd =
