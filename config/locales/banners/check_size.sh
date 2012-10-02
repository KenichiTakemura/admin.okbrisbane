#!/bin/bash
for f in `find . -type f`; do
	size=`identify -format %w%h $f`;
	if [ $f =~ $size ]; then
		echo 'match $f and $size';
	else
		echo 'not match $f and $size';
	endif
done
