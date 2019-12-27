if type -q 'nvim'
    set -x EDITOR 'nvim'
    set -x PAGER  'nvimpager'
end

. ~/.config/fish/aliases.fish

# Disable startup greeting
set fish_greeting ''
