#!/bin/bash

IFS=$(echo -e "\t\n")

timestamp=$(date -u "+%Y-%d-%m-%H-%M")
uploadfolder=${HOME}/public_html/multiple_image_upload/uploads
bkpfolder=${HOME}/uploads_site
newfolder=${bkpfolder}/pasta-${timestamp}

if [ $(ls -1A ${uploadfolder} | wc -l) -gt 0 ]; then
	mkdir ${newfolder}
	mv ${uploadfolder}/* ${newfolder}/
fi

find ${bkpfolder}/pasta* \( -iname "*.jpeg" -or -iname "*.jpg" \) | while read -r FILE
do
	mv -v "$FILE" ${thisscript}/../images/REF${imovel}/${count}.jpg
	count=$((count+1))
done







====================
#!/bin/bash



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

exit 0

