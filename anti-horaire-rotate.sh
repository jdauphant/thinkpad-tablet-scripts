#!/bin/sh

MODE=`xsetwacom --list | cut -d " " -f 1-4 | (read type; xsetwacom get "$type" rotate)`
case "$MODE" in
	NONE | none)
	NEW_MODE="left"
	;;
	CCW | ccw)
	NEW_MODE="invert"
	;;
	HALF | half)
	NEW_MODE="right"
	;;
	*)
	NEW_MODE="normal"
	;;
esac

changemode.sh $NEW_MODE
	
