# /etc/skel/.bash_profile

PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/.local/bin
export PATH

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
    . ~/.bashrc
fi

# Disable bash history
unset HISTFILE
if [ -f $HOME/.bash_history ]; then
    rm -f $HOME/.bash_history
fi

# Disable tig history
if [ -f $HOME/.tig_history ]; then
    rm -f $HOME/.tig_history
fi

export TIGRC_USER='$HOME/.config/tig/tigrc'

# Start X at login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx;
fi
