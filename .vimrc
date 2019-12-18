set encoding=utf-8                              " Open files as UTF-8
scriptencoding utf-8                            " Encodig for multibyte
set fileencoding=utf-8                          " Save files as UTF-8
set fileencodings=utf-8,ucs-boms,euc-jp,cp932   " Auto detection when reading
set fileformats=unix,dos,mac                    " Line feed code
set ambiwidth=double                            " Prevent collapse of �� and ��

set nobackup                                    " Disable backup
set nowritebackup                               " Disable backup
set swapfile                                    " Enable swap
if has ('nvim')
    set directory=~/.cache/nvim/swap            " Swap directory
    set undodir=~/.cache/nvim/undo              " Undo directory
else
    set directory=~/.cache/vim/swap             " Swap directory
    set undodir=~/.cache/vim/undo               " Undo directory
endif
set undofile                                    " Enable undo

set number                                      " Show line numbers

set tabstop=4                                   " Recognize 4 spaces as tab
set shiftwidth=0                                " Value to shift when indented (0 = tabstop value)
set autoindent                                  " Take over the previous indent
set smartindent                                 " C-like smart indent
set expandtab                                   " Use space instead of tab

set clipboard&                                  " Set clipboard values to default
set clipboard^=unnamedplus                      " Enable <C-c><C-v> type clipboard

" Folding
set foldmethod=marker
set foldlevel=0
set foldcolumn=3

" Delete unnecessary spaces "{{{
aug deleteSpaces
    au!
    au BufWritePre * call s:delete_space()
aug END

function! s:delete_space()
    " Delete last spaces
    %s/\s\+$//ge
    " Delete last brank lines
    while getline('$') == ""
        $delete _
    endwhile
endfunction
"}}}

" Auto comment off
aug autoCommentOff
    au!
    au BufEnter * setl formatoptions-=r
    au BufEnter * setl formatoptions-=o
aug END

" Search / Replace
set ignorecase                                  " Search case insensitive
set smartcase                                   " Search case sensitive when entering uppercase
set gdefault                                    " Assign g option by default at replacement

" Overwriting textwidth (Default : 78)
aug noWrapping
    au!
    au BufEnter * set textwidth=0
aug END

" key mappings
" Disable macros
nnoremap q <Nop>

" Disable substitution insert (word)
nnoremap s <Nop>
" Disable substitution insert (line)
nnoremap S <Nop>

" Assign ZX to write in normal mode
nnoremap ZX :w<CR>
" Assign ZX to write in insert mode
inoremap ZX <ESC>:w<CR>

nnoremap <silent> <ESC><ESC> :nohl<CR>
