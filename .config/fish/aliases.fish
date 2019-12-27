# System aliases #{{{
#-------------------------------------------------------------------------------
alias v (echo $EDITOR)
alias la 'ls -ahl'

# Quick edits #{{{
#-----------------
alias ea 'v ~/.config/fish/aliases.fish'
alias ec 'v ~/.config/fish/config.fish'
#}}}
#}}}

# git aliases #{{{
#-------------------------------------------------------------------------------
alias gs   'git status'
alias ga   'git add'
alias gc   'git commit'
alias gp   'git push'
alias gb   'git branch'
alias gl   'tig'
alias gco  'git checkout'
alias gcom 'git checkout master'
alias gss  'git stash -u'
alias gsa  'git stash apply'
alias gsd  'git stash drop'
alias gsl  'git stash list'
alias gri  'git rebase -i HEAD~10'
alias grc  'git rebase --continue'

function ginit
    git init
    touch .gitignore
    git add .gitignore
    git commit -m "[INIT] Initialize repository"
end

function glg
    tig --grep=$argv[1]
end
#}}}
