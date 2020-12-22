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

" Plugins added
Plug 'vim-airline/vim-airline' " Airline core
Plug 'vim-airline/vim-airline-themes' " Airline common themes
Plug 'tpope/vim-sensible' " Sensible vim
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --rust-completer' } " Autocomplete
Plug 'scrooloose/nerdtree' " NERDTree file sidebar

" Initialise plugins
call plug#end()

" NERDTree configuration
if exists('NERDTree')
    " Start NERDTree and put the cursor back in the other window.
    autocmd VimEnter * NERDTree | wincmd p
    
    " Exit Vim if NERDTree is the only window left.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
        \ quit | endif
endif
