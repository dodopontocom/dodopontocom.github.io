#!/bin/bash

num=$(ls -1A ${home}/dodopontocom.github.io/refs/ref*.html | wc -l)
sum=$((num+1))
novo=REF0${sum}
novofullpath=${HOME}/images/${novo}/
echo "caminho do novo anuncio: $novofullpath"

if [ -d ${novofullpath} ]; then
	echo "novo anuncio ja foi adicionado..."
	exit 0
else
	mkdir ${novofullpath}
	if [ "$?" -eq "0"]; then
		echo "${novo} foi criado em ${novofullpath}"
	else
		echo "algo deu errado... saindo"
		exit 0
	fi
fi