#!/usr/bin/env bash

mmsg -wt | while mapfile -t -n 12 chunk && ((${#chunk[@]} > 0))
do
	pop="$(printf "${chunk[11]}" | cut -d' ' -f3 | rev)"
	act="$(printf "${chunk[11]}" | cut -d' ' -f4 | rev)"
	urg="$(printf "${chunk[11]}" | cut -d' ' -f5 | rev)"
    for i in {0..8}; do
			declare idx=$((i + 1))
			echo "tag_${idx}_idx|int|$idx"
			echo "tag_${idx}_pop|int|${pop:i:1}"
			echo "tag_${idx}_act|int|${act:i:1}"
    done
		echo
done
