set encoding=utf-8                              " Open files as UTF-8
scriptencoding utf-8                            " Encodig for multibyte
set fileencoding=utf-8                          " Save files as UTF-8
set fileencodings=utf-8,ucs-boms,euc-jp,cp932   " Auto detection when reading
set fileformats=unix,dos,mac                    " Line feed code
set ambiwidth=double                            " Prevent collapse of ¢¢ and ¡û

set nobackup                                    " Disable backup
set nowritebackup                               " Disable backup
set directory=~/.cache/vim/swap
set swapfile                                    " Enable swap
set undodir=~/.cache/vim/undo
set undofile                                    " Enable undo

set number                                      "Show line numbers

set tabstop=4                                   " Recognize 4 spaces as tab
set shiftwidth=0                                " Value to shift when indented (0 = tabstop value)
set autoindent                                  " Take over the previous indent
set smartindent                                 " C-like smart indent
set expandtab                                   " Use space instead of tab

set clipboard&                                  " Set clipboard values to default
set clipboard^=unnamedplus                      " Enable <C-c><C-v> type clipboard

" key mappings

nnoremap q <Nop>                                " Disable macros

nnoremap s <Nop>                                " Disable substitution insert (word)
nnoremap S <Nop>                                " Disable substitution insert (line)

nnoremap ZX :w<CR>                              " Assign ZX to write in normal mode
inoremap ZX <ESC>:w<CR>                         " Assign ZX to write in insert mode

nnoremap <silent> <ESC><ESC> :nohl<CR>
