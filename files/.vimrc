" mouse
set mouse=a

" line numbers
set number

" highlighting
filetype plugin on
syntax on

" tabbing
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" backspace
set backspace=indent,eol,start

" colourscheme
syntax on
colorscheme onedark
let g:airline_theme='onedark'

" silly
cnoreabbrev W w
cnoreabbrev Wq wq

" nerdtree
let g:NERDTreeWinSize=24
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" tabnine (cc)
set rtp+=~/.vim/tabnine-vim

" black (cc)
nnoremap <C-S-i> :Black<CR>
