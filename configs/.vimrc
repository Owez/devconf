" Line numbers
set number

" Tabstops
set tabstop=4       " Size of a hard tabstop
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" Auto-install https://github.com/junegunn/vim-plug/ if not already
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Start plugin definitions
call plug#begin('~/.vim/plugged')

" Plugin Airline (like powerline which is like powerlevel10k)
Plug 'vim-airline/vim-airline' " Core
Plug 'vim-airline/vim-airline-themes' " Themes

" Plugin sensible vim setup
Plug 'tpope/vim-sensible'

" Plugin autocomplete
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --rust-completer' }

" Initialise plugins
call plug#end()
