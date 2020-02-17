#!/bin/bash
xrdb -merge ~/.Xresources
autocutsel -fork
autorandr -c
exec i3
