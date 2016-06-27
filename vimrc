set mouse=a

set nu
set rnu

set autoindent
set copyindent
set expandtab
set smarttab
set smartindent
set ts=4 sw=4

set autoread
set title

set hlsearch
set incsearch

set laststatus=2

set list
set listchars=tab:>-,trail:~,extends:>,precedes:<

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

call plug#end()

let g:airline_powerline_fonts = 1
let g:airline_theme = 'zenburn'
let g:airline#extensions#tabline#enabled = 1

map <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

nnoremap <C-t> :tabnew<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile Makefile* set noexpandtab

augroup CursorLine
    au!

    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au VimEnter,WinEnter,BufWinEnter * hi CursorLine cterm=NONE ctermbg=black
    au WinLeave * setlocal nocursorline

    "au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
    "au VimEnter,WinEnter,BufWinEnter * hi CursorColumn cterm=NONE ctermbg=darkred
    "au WinLeave * setlocal nocursorcolumn
augroup END
