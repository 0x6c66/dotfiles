#!/bin/sh

# Merge resources
xrdb -merge ~/.Xresources

# Set keyboard layout for X session
setxkbmap -model hhk -layout us -variant intl

# Start clipboard synchronisation daemons to sync buffers, clipboard and primary
autocutsel -selection PRIMARY -fork
autocutsel -selection CLIPBOARD -fork

# Set up screens based on attached displays
autorandr -c

# Start notification daemon
dunst -config ~/.dunstrc &

# Start window manager
exec i3
