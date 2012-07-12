#!/bin/sh


xsetwacom --list | cut -d " " -f 1-4 | (
	while read type ; do
		/usr/bin/xsetwacom set "$type" MapToOutput LVDS1 
	done
)
