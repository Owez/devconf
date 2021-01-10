" Line numbers
set number

" Make cursor into line
set cursorline

" Tabstops
set tabstop=4 " Size of a hard tabstop
set shiftwidth=4 " Indents will have a width of 4
set softtabstop=4 " Sets the number of columns for a TAB
set expandtab " Expand TABs to spaces

" Column 80 and 120 rulers for visual indication
set colorcolumn=80
highlight ColorColumn ctermbg=237

" Bracket autoclose
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Map keys for `:term`
if has('terminal')
    set termwinsize=12x0
    map <C-t> :bel term<CR>
endif

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
Plug 'sonph/onehalf', { 'rtp': 'vim' } " Theme
call plug#end()

" Autoinstall plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | qa
  \| endif

" Set themes
colorscheme onehalfdark
let g:airline_theme='deus'

" Allow scroll to be visible 2 chars down
set scrolloff=2

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" NERDTree config options
let NERDTreeShowHidden=1 " Show NERDtree hidden files
let g:airline_powerline_fonts = 1 " Auto-populate powerline fonts
let g:NERDTreeDirArrowExpandable = '+' " Arrow
let g:NERDTreeDirArrowCollapsible = '-' " Arrow
let g:NERDTreeWinSize=20 " Window width
