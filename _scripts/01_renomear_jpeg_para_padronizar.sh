#!/bin/bash

IFS=$(echo -e "\t\n")

echo "script: $0"

thisscript="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
timestamp=$(date -u "+%Y-%d-%m-%H-%MZ")

#validando argumentos
if [[ "$#" -eq 0 || "$#" -gt 1 ]]; then
	echo "precisa de 1 e somente 1 argumento!"
	exit -1
fi
echo "argumento is $1"

imovel=$1


count=1

find ${thisscript}/../images/REF${imovel}/ \( -iname "*.jpeg" -or -iname "*.jpg" \) | while read -r FILE
do
	mv -v "$FILE" ${thisscript}/../images/REF${imovel}/${count}.jpg
	count=$((count+1))
done



reset
