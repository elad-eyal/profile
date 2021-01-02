:silent! colorscheme sahara

if has('win64')
  set backupdir=$TEMP//,.
  set directory=$TEMP//,.
endif

if has('syntax_on')
  syntax enable
endif

if has('gui_running')
    set guifont=Courier_new:h18
endif

set mouse=a
" This should enable drag to resize split:
set ttymouse=xterm2

" force 256-color mode
set t_Co=256
" Enable powerline symbols for airline-vim
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

set wrap
set linebreak
set cursorline
" highlight CursorLine cterm=NONE ctermbg=gray


" Back and Forward mouse buttons
map <X1Mouse> <c-o>
map <X2Mouse> <c-i>

" vim without any parameters  should open current  directory
au VimEnter * if eval("@%") == "" | e . | endif

" default directory view is tree (shift-ENTER to exapnd)
let g:netrw_liststyle=3

