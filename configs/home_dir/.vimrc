" Auto-install https://github.com/junegunn/vim-plug/ if not already
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Start plugin definitions
call plug#begin('~/.vim/plugged')

" Airline (like powerline which is like powerlevel10k)
Plug 'vim-airline/vim-airline' " Core
Plug 'vim-airline/vim-airline-themes' " Themes

" Initialise plugins
call plug#end()

" Ensure plugins are installed
:PlugInstall
:q
