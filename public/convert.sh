#!/bin/bash

for file in ./**/* ;
do
	echo $file
	mp3=$(echo $file | sed 's/.wav/.mp3/g')
	ffmpeg -i $file -vn -ar 44100 -ac 2 -b:a 192k $mp3
done

