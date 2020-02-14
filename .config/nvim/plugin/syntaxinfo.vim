if exists('g:loaded_syntaxinfo')
    finish
endif
let g:loaded_syntaxinfo = 1

command! SyntaxInfo call syntaxinfo#get_syn_info()
