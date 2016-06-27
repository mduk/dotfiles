set mouse=a

set nu
set rnu

set autoindent
set expandtab
set smarttab
set smartindent
set ts=4 sw=4

set hlsearch

set list
set listchars=tab:>-,trail:~,extends:>,precedes:<

au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile Makefile* set noexpandtab

augroup CursorLine
    au!

    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au VimEnter,WinEnter,BufWinEnter * hi CursorLine cterm=NONE ctermbg=darkred
    au WinLeave * setlocal nocursorline

    "au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
    "au VimEnter,WinEnter,BufWinEnter * hi CursorColumn cterm=NONE ctermbg=darkred
    "au WinLeave * setlocal nocursorcolumn
augroup END
