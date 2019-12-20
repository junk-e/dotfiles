# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.
if type nvim > /dev/null 2>&1; then
    export EDITOR='nvim'
    export PAGER='nvimpager'
fi

alias la='ls -ahl'
alias v='${EDITOR}'

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gb='git branch'
alias gl='tig'
alias gco='git checkout'
alias gcom='git checkout master'
alias gss='git stash -u'
alias gsa='git stash apply'
alias gsd='git stash drop'
alias gsl='git stash list'
alias gri='git rebase -i HEAD~10'
alias grc='git rebase --continue'
alias ginit='git init && touch .gitignore && git add .gitignore && git commit -m "[INIT] Initialize repository"'
