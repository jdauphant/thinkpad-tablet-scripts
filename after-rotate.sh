#!/bin/sh

MODE=`xsetwacom --list | cut -d " " -f 1-4 | (read type; xsetwacom get "$type" rotate)`
case "$MODE" in
	NONE | none) # normal
	gconftool-2 --set /apps/panel/toplevels/top_panel_screen0/size --type integer 24
	cellwriter --hide-window --keyboard-only
	;;
	CCW | ccw) # left
	gconftool-2 --set /apps/panel/toplevels/top_panel_screen0/size --type integer 34
	cellwriter --show-window --keyboard-only
	;;
	HALF | half) # invert
	gconftool-2 --set /apps/panel/toplevels/top_panel_screen0/size --type integer 34
        cellwriter --show-window --keyboard-only
	;;
	*) # right
	gconftool-2 --set /apps/panel/toplevels/top_panel_screen0/size --type integer 34
	cellwriter --show-window --keyboard-only
	;;
esac

	
