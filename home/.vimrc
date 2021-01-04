" This is https://github.com/eladeyal-intel/profile/blob/master/home/.vimrc

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

" Show line numbers
set number


" Back and Forward mouse buttons
map <X1Mouse> <c-o>
map <X2Mouse> <c-i>

" Alt-Left/Right is Forward/Backwards
map <esc>[1;3D <c-o>
map <esc>[1;3C <c-i>

" vim without any parameters should open current directory browser
let g:my_is_stdin = 0
autocmd StdinReadPre * let g:my_is_stdin = 1
autocmd VimEnter *  if argc() == 0 | if g:my_is_stdin == 0 | e . | endif | endif

" default directory view is tree (shift-ENTER to expand)
let g:netrw_liststyle=3

