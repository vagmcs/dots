#!/bin/bash

xrdb ${XDG_CONFIG_HOME:-$HOME/.config}/X11/xresources &
${HOME}/.local/bin/setbg & # restore the background using the setbg script
picom &								# composer
dunst &								# dunst for notifications
unclutter & 					# remove mouse cursor when idle
jetbrains-toolbox &		# start the toolbox
owncloud &						# start owncloud
insync start &				# start insync
