#!/bin/sh

if [ -z $DISPLAY ] ; then 
	export DISPLAY=":0.0"
fi

case "$1" in
	invert | i)
	NEW_ROTATION="inverted"
	NEW_WACOM="half"
	;;
	right | r)
	NEW_ROTATION="right"
	NEW_WACOM="ccw"
	;;
	left | l)
	NEW_ROTATION="left"
	NEW_WACOM="cw"
	;;
	*)	
	NEW_ROTATION="normal"
	NEW_WACOM="none"
	;;	
esac


xsetwacom --list | cut -d " " -f 1-4 | (
	while read type ; do
		/usr/bin/xsetwacom set "$type" rotate $NEW_WACOM
	done
)
xrandr --output LVDS1 --rotate $NEW_ROTATION
