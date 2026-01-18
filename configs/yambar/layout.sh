#! /usr/bin/env bash

mmsg -wl | while read -r line
do
	echo -e "layout|string|$(echo $line | cut -d' ' -f3)\n"
done
