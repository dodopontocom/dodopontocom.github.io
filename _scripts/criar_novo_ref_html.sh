#!/bin/bash

info=$(find . -iname info.txt)
ref=$(cat $info | grep ref | cut -d':' -f2)
eref=$(cat $info | grep eref | cut -d':' -f2)
preco=$(cat $info | grep preco | cut -d':' -f2)
metro=$(cat $info | grep metro | cut -d':' -f2)

for pic in $(ls imagens/)
do

cat << _EOF_
<!-- -->
<img src="${pic}">
_EOF_


done

cat << _EOF_
<!-- -->
<!-- ${ref} -->
<div>
<!--referencia ${ref} -->
<!--especial referencia $eref -->
<!--preco $preco -->
<!--metros quadrados $metro -->
<!-- ------ $pic -->
</div>
<!-- ${ref}-->
<!-- -->

_EOF_


