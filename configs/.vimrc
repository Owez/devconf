" Line numbers
set number

" Tabstops
set tabstop=4 " Size of a hard tabstop
set shiftwidth=4 " Indents will have a width of 4
set softtabstop=4 " Sets the number of columns for a TAB
set expandtab " Expand TABs to spaces

" Column 80 and 120 rulers for visual indication
set colorcolumn=80
highlight ColorColumn ctermbg=237

" Auto-install vim-plug if not already
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin definitions
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline' " Airline core
Plug 'vim-airline/vim-airline-themes' " Airline common themes
Plug 'tpope/vim-sensible' " Sensible vim
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --rust-completer' } " Autocomplete
Plug 'preservim/nerdtree' " NERDTree file sidebar
call plug#end()

" Autoinstall plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
