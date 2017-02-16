#!/bin/bash

vendas=$(find . -iname vendas.html)
inserir=$(cat $vendas | awk '/24062017i/{print NR}')
#terminar=$(cat $vendas | awk '/24062017t/{print NR}')
info=$(find . -iname info.txt)
ref=$(cat $info | grep ref | cut -d':' -f2)
eref=$(cat $info | grep eref | cut -d':' -f2)
preco=$(cat $info | grep preco | cut -d':' -f2)
metro=$(cat $info | grep metro | cut -d':' -f2)

for c in $ref $eref $preco $metro $vaz
do
	if [ -z $c ]
	then
		$c="vazio"
	fi
done

sed -i "/24062017i/a \
<!-- --> \n\
<!-- ${ref} --> \n\
<div> \n\
<!--referencia ${ref} --> \n\
<!--especial referencia $eref --> \n\
<!--preco $preco --> \n\
<!--metros quadrados $metro --> \n\
<!-- linha retirada $inserir --> \n\
</div> \n\
<!-- ${ref}--> \n\
<!-- --> \n\
<!-- 24062017i --> \n" $vendas

sed -i "${inserir}d" $vendas






