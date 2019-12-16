#!/bin/bash

function run {
    if ! pgrep $1; then
        $@ &
    fi
}

run fcitx
run conky -c ~/.config/awesome/conky/conky.lua
run google-chrome-stable
