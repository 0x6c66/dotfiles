#!/bin/bash
xrdb -merge ~/.Xresources
autocutsel -fork
autorandr -c
dunst -config ~/.dunstrc & 
exec i3
