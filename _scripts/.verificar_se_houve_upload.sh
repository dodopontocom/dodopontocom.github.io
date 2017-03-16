#!/bin/bash

IFS=$(echo -e "\t\n")

cd ${HOME}/dodopontocom.github.io
git pull
cd -

timestamp=$(date -u "+%Y-%d-%m-%H-%M")
uploadfolder=${HOME}/public_html/multiple_image_upload/uploads
bkpfolder=${HOME}/uploads_site
newfolder=${bkpfolder}/pasta-${timestamp}


#verifica se ha novos uploads na pasta ${uploadfolder}
if [ $(ls -1A ${uploadfolder} | wc -l) -gt 0 ]; then
	mkdir ${newfolder}
	mv ${uploadfolder}/* ${newfolder}/
else
	echo "${timestamp} - nada de uploads no momento, volte mais tarde..."
	exit 0
fi

#cria nova pasta do anuncio no repositorio
num=$(ls -1A ${HOME}/dodopontocom.github.io/refs/ref*.html | wc -l)
sum=$((num+1))
novo=REF0${sum}
novolower=ref0${sum}
novofullpath=${HOME}/dodopontocom.github.io/images/${novo}
repo=${HOME}/dodopontocom.github.io
echo "${timestamp} - caminho do novo anuncio: $novofullpath"

if [ -d ${novofullpath} ]; then
	echo "${timestamp} - novo anuncio ja foi adicionado..."
	exit 0
else
	mkdir ${novofullpath}
	if [ "$?" -eq 0 ]; then
		echo "${timestamp} - ${novo} foi criado em ${novofullpath}"
	else
		echo "${timestamp} - algo deu errado... saindo"
		exit 0
	fi
	cp ${repo}/info.txt ${novofullpath}
	sed -i "s/^ref:/ref:${novolower}/g" ${novofullpath}/info.txt
fi

#########

#mover imagens do bkpfolder para a pasta do anuncio atual
#mudar os nomes das imagens

mv ${newfolder}/* ${novofullpath}/

count=1

find ${novofullpath} \( -iname "*.jpeg" -or -iname "*.jpg" \) | while read -r FILE
do
	mv -v "$FILE" ${novofullpath}/${count}.jpg
	count=$((count+1))
done

# comitar no repo mas sem dar push
cd ${HOME}/dodopontocom.github.io/
git add --all
git commit -m "${timestamp} - automatico do verificar se houve uploads"


echo "========${timestamp}================"
git log origin/master..HEAD
echo "========${timestamp}================"




exit 0
