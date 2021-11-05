" This is https://github.com/eladeyal-intel/profile/blob/master/home/.vimrc
" Local configurations go in the file $HOME/.local.vimrc

if ! ( $TERM_PROGRAM ==? 'vscode' )
    :silent! colorscheme sahara
endif

if has('win64')
  set backupdir=$TEMP//,.
  set directory=$TEMP//,.
endif

if has('syntax_on') || has('syntax')
  syntax enable
  highlight Comment cterm=italic
endif

if has('gui_running')
    set guifont=Courier_new:h18
endif

" Highlight search incrementally and globally
set incsearch hlsearch

" Enable mouse
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

" Show tabs and trailing whitespaces
if has("multi_byte")
    set listchars=tab:▸\ ,trail:·
else
    set listchars=tab:>\ ,trail:*
endif
set list

" Back and Forward mouse buttons
map <X1Mouse> <c-o>
map <X2Mouse> <c-i>

" Alt-Left/Right is Forward/Backwards
map <esc>[1;3D <c-o>
map <esc>[1;3C <c-i>

" F4 is save and quit
nnoremap <F4> ZZ<cr>
inoremap <F4> <esc>

" vim without any parameters should open current directory browser
let g:my_is_stdin = 0
autocmd StdinReadPre * let g:my_is_stdin = 1
autocmd VimEnter *  if argc() == 0 | if g:my_is_stdin == 0 | e . | endif | endif

" default directory view is tree (shift-ENTER to expand)
let g:netrw_liststyle=3

" type :Code to open VS Code on current file (if possible)
command Code call job_start("code -g " . expand("%:p") . ":" . line(".") . ":" . col("."))

" Enable spellcheck for git commit messages
autocmd FileType gitcommit setlocal spell

" Show spelling errors with underline too
hi SpellBad cterm=underline
hi SpellBad gui=undercurl

" Source a local vimrc {{{
    let $MYLOCALVIMRC = $HOME . "/.local.vimrc"
    if filereadable($MYLOCALVIMRC)
        source $MYLOCALVIMRC
    endif
" }}} 
