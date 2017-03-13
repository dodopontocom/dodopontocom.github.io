#!/bin/bash

IFS=$(echo -e "\t\n")

count=1

find . \( -iname "*.jpeg" -or -iname "*.jpeg" \) | while read -r FILE
do
	mv -v "$FILE" 0${count}.jpg
	count=$((count+1))
done



reset
