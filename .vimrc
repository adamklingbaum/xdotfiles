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
Plug 'nanotech/jellybeans.vim', { 'as': 'jellybeans' }
Plug 'tpope/vim-fugitive'

call plug#end()

set autoindent
set clipboard+=unnamedplus
set tabstop=2
set shiftwidth=2
set number
set ruler

syntax on
filetype plugin indent on

autocmd VimResized * :wincmd =

let g:ale_sign_error = '●'
let g:ale_sign_warning = '•'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#tabline#enabled = 1
let g:jellybeans_use_term_italics = 1
let g:jellybeans_use_lowcolor_black = 1

nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP
nnoremap <C-f> :Files<Cr>
nnoremap <C-g> :Rg<Cr>

colorscheme dracula
highlight Normal ctermbg=None
