" Required
filetype plugin indent off
syntax off

" Dein.vim "{{{
if has ('nvim')
    " Set dein paths
    let s:config_home = expand('~/.config')
    let s:nvimdir = s:config_home . '/nvim'
    let s:cache_home = expand('~/.cache')
    let s:dein_dir = s:cache_home . '/dein'
    let s:dein_github = s:dein_dir . '/repos/github.com'
    let s:dein_repo_name = 'Shougo/dein.vim'
    let s:dein_repo_dir = s:dein_github . '/' . s:dein_repo_name

    " Check dein has been installed or not.
    if !isdirectory(s:dein_repo_dir)
        let s:git = system("which git")
        if strlen(s:git) != 0
            echo 'dein is not installed, install now.'
            let s:dein_repo = 'https://github.com' . '/' .  s:dein_repo_name
            echo 'git clone ' . s:dein_repo . ' ' . s:dein_repo_dir
            call system('git clone ' . s:dein_repo . ' ' . s:dein_repo_dir)
        endif
    endif

    " Add the dein installation directory into runtimepath
    let &runtimepath = &runtimepath . ',' . s:dein_repo_dir

    " Begin plugin installation
    if dein#load_state(s:dein_dir)
        call dein#begin(s:dein_dir)
            let s:toml = s:nvimdir . '/dein.toml'
            let s:lazy_toml = s:nvimdir . '/dein_lazy.toml'
            call dein#load_toml(s:toml, {'lazy': 0})
            call dein#load_toml(s:lazy_toml, {'lazy': 1})
        call dein#end()
        call dein#save_state()
    endif

    " Installation check
    if dein#check_install()
        call dein#install()
    endif
endif

"}}}

" Required
filetype plugin indent on
syntax enable

" Colorscheme
set termguicolors
colorscheme identity

set encoding=utf-8                              " Open files as UTF-8
scriptencoding utf-8                            " Encodig for multibyte
set fileencoding=utf-8                          " Save files as UTF-8
set fileencodings=utf-8,ucs-boms,euc-jp,cp932   " Auto detection when reading
set fileformats=unix,dos,mac                    " Line feed code
set ambiwidth=single                            " Prevent collapse of ¢¢ and ¡û

set nobackup                                    " Disable backup
set nowritebackup                               " Disable backup
set swapfile                                    " Enable swap
set undofile                                    " Enable undo
if has ('nvim')
    set directory=~/.cache/nvim/swap            " Swap directory
    set undodir=~/.cache/nvim/undo              " Undo directory
    let g:netrw_home='~/.cache/nvim'            " netrw home directory
else
    set directory=~/.cache/vim/swap             " Swap directory
    if !isdirectory(&directory)
        call mkdir(&directory, 'p')
    endif
    set undodir=~/.cache/vim/undo               " Undo directory
    if !isdirectory(&undodir)
        call mkdir(&undodir, 'p')
    endif
    let g:netrw_home='~/.cache/vim'             " netrw home directory
endif

set number                                      " Show line numbers

" relative line numbers
aug numbertoggle
    au!
    au BufEnter,FocusGained,InsertLeave *
        \ set relativenumber
    au BufLeave,FocusLost,InsertEnter   *
        \ set norelativenumber
aug END

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

" Storing folds
aug storing_folds
  au!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1
aug END

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

set textwidth=100                               " Overwriting textwidth (Default : 78)

" Call colorcolumn recursively (http://bit.ly/2uZwt2N)
exe "set cc=" . join(range(101,999), ',')

" Conceal
set conceallevel=2                              " Automatically hides stretches of text
set concealcursor=niv                           " Mode NOT to release conceal: normal,insert,visual
let g:tex_conceal=''                            " Disable conceal in TeX

" Display invisible characters
set list
set listchars=tab:\|-,nbsp:%

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
