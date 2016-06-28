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

" Define Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
call plug#end()

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'zenburn'
let g:airline#extensions#tabline#enabled = 1

" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Tab Navigation
nnoremap <C-t> :tabnew<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Turn off NERDTree for config files typically invoked through aliases
autocmd BufRead,VimEnter */i3/config :NERDTreeClose
autocmd BufRead,VimEnter .vimrc :NERDTreeClose

" Indentation settings for various languages
autocmd BufRead,BufNewFile *.py set expandtab ts=4 sw=4
autocmd BufRead,BufNewFile Makefile* set noexpandtab ts=4 sw=4
autocmd BufRead,BufNewFile *.js set expandtab ts=2 sw=2
autocmd BufRead,BufNewFile *.php set expandtab ts=4 sw=4

" Highlight the line that the cursor is on
augroup CursorLine
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd VimEnter,WinEnter,BufWinEnter * hi CursorLine cterm=NONE ctermbg=black
    autocmd WinLeave * setlocal nocursorline
augroup END
