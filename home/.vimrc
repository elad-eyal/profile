colorscheme desert
syntax enable

if has('gui_running')
    set guifont=Courier_new:h18
endif

set mouse=a

" force 256-color mode
set t_Co=256

set wrap
set linebreak
set cursorline
" highlight CursorLine cterm=NONE  ctermbg=gray


" Back and Forward mouse buttons
map <X1Mouse> <c-o>
map <X2Mouse> <c-i>


