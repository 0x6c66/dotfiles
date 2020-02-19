#!/bin/sh

# Merge resources
xrdb -merge ~/.Xresources

# Start clipboard synchronisation daemons to sync buffers, clipboard and primary
autocutsel -fork
autocutsel -selection PRIMARY -fork

# Set up screens based on attached displays
autorandr -c

# Start notification daemon
dunst -config ~/.dunstrc &

# Start window manager
exec i3
