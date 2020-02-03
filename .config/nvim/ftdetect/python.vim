au BufNewFile,BufRead *.py set textwidth=80
au BufNewFile,BufRead *.py exe "set cc=" . join(range(81,999), ',')
