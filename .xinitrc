#!/bin/bash
xrdb -merge ~/.Xresources
autocutsel -selection PRIMARY -fork
autorandr -c
dunst -config ~/.dunstrc & 
exec i3
