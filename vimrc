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

set encoding=utf-8

"###############################################################################
" Automatically reload the .vimrc file when it has been written
"###############################################################################
autocmd BufWritePost $MYVIMRC nested source $MYVIMRC

"###############################################################################
" Tab Navigation
"###############################################################################
nnoremap <C-t> :tabnew<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

"###############################################################################
" Indentation
"###############################################################################
autocmd BufRead,BufNewFile *.py set expandtab ts=4 sw=4
autocmd BufRead,BufNewFile Makefile* set noexpandtab ts=4 sw=4
autocmd BufRead,BufNewFile *.js set expandtab ts=2 sw=2
autocmd BufRead,BufNewFile *.php set expandtab ts=4 sw=4

"###############################################################################
" Highlight the line that the cursor is on
"###############################################################################
augroup CursorLine
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd VimEnter,WinEnter,BufWinEnter * hi CursorLine cterm=NONE ctermbg=black
    autocmd WinLeave * setlocal nocursorline
augroup END

"###############################################################################
" Define Plugins
"###############################################################################
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'nvie/vim-flake8'
Plug 'Chiel92/vim-autoformat'
call plug#end()

"###############################################################################
" Plugin: Autoformat
"###############################################################################

" Autoformat source on F3
noremap <F3> :Autoformat<CR>

"###############################################################################
" Plugin: Flake8
"###############################################################################

" Run flake8 over all Python files when they're written
autocmd BufWritePost *.py call Flake8()

"###############################################################################
" Plugin: Airline
"###############################################################################
let g:airline_powerline_fonts = 1
let g:airline_theme = 'zenburn'
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"###############################################################################
" Plugin: NERDTree
"###############################################################################
map <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Turn off NERDTree for editing git commit messages
autocmd VimEnter * if &filetype ==# 'gitcommit' | NERDTreeClose | endif

" Turn off NERDTREE for editing git diffs
autocmd VimEnter * if &filetype ==# 'diff' | NERDTreeClose | endif

" Turn off NERDTree for config files typically invoked through aliases
autocmd BufRead,VimEnter */i3/config :NERDTreeClose
autocmd BufRead,VimEnter .vimrc :NERDTreeClose

" Automatically close NERDTree if it's the only window left
" Pilfered from: https://github.com/scrooloose/nerdtree/issues/21
function! NERDTreeQuit()
    redir => buffersoutput
    silent buffers
    redir END
    "                     1BufNo  2Mods.     3File           4LineNo
    let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
    let windowfound = 0

    for bline in split(buffersoutput, "\n")
        let m = matchlist(bline, pattern)

        if (len(m) > 0)
            if (m[2] =~ '..a..')
                let windowfound = 1
            endif
        endif
    endfor

    if (!windowfound)
        quitall
    endif
endfunction

autocmd WinEnter * call NERDTreeQuit()

"###############################################################################
" Strip trailing whitespace
"###############################################################################
fun! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()