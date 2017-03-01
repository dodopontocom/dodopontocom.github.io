#!/bin/bash

vendas=$(find . -iname vendas.html)
inserir=$(cat $vendas | awk '/24062017i/{print NR}')
#terminar=$(cat $vendas | awk '/24062017t/{print NR}')
info=$(find ../images/REF002/ -iname info.txt)

ref=$(cat $info | grep ref | cut -d':' -f2)
eref=$(cat $info | grep eref | cut -d':' -f2)
preco=$(cat $info | grep preco | cut -d':' -f2)
metro=$(cat $info | grep metro | cut -d':' -f2)
dormi=$(cat $info | grep dormi | cut -d':' -f2)
banho=$(cat $info | grep banho | cut -d':' -f2)
titulo=$(cat $info | grep titulo | cut -d':' -f2)
descri=$(cat $info | grep descri | cut -d':' -f2)
contato1=$(cat $info | grep contato1 | cut -d':' -f2)
telefone1=$(cat $info | grep telefone1 | cut -d':' -f2)
contato2=$(cat $info | grep contato2 | cut -d':' -f2)
telefone2=$(cat $info | grep telefone2 | cut -d':' -f2)
financiamento=$(cat $info | grep financiamento | cut -d':' -f2)
item1=$(cat $info | grep item1 | cut -d':' -f2)
item2=$(cat $info | grep item2 | cut -d':' -f2)
item3=$(cat $info | grep item3 | cut -d':' -f2)
item4=$(cat $info | grep item4 | cut -d':' -f2)
item5=$(cat $info | grep item5 | cut -d':' -f2)
mconstru=$(cat $info | grep mconstru | cut -d':' -f2)
destaque=$(cat $info | grep destaque | cut -d':' -f2)
locacao=$(cat $info | grep locacao | cut -d':' -f2)
captacao=$(cat $info | grep captacao | cut -d':' -f2)
prop=$(cat $info | grep prop | cut -d':' -f2)
local=$(cat $info | grep local | cut -d':' -f2)
imagens=$(cat $info | grep imagens | cut -d':' -f2)

refnumber=$(cat $info | grep ref | cut -d':' -f2 | grep -o [0-9][0-9][0-9])

#########
sed -i "/24062017i/a \
<!-- item imovel-->\n \
<div class="w3l_services_grid">\n \
<ul>\n \
<li class="square">${metro} m²</li>\n \
<li class="bath">${banho}</li>\n \
<li class="bed">${dormi}</li>\n \
</ul>\n \
<div class="hover15 column">\n \
<div>\n \
<a href="${ref}.html">\n \
<figure>\n \
<img src="../images/REF${refnumber}/001.jpg" alt=" " class="img-responsive" />\n \
<h5 class="cima"><span class="refspan">REF${refnumber}</span></h5>\n \
<h5 class="local"><span class="refspan">${titulo}</span></h5>\n \
</figure>\n \
</a>\n \
</div>\n \
</div>\n \
<h4><a href="${ref}.html">R$ ${preco}</a></h4>\n \
<p>${descri}<a class="bake" href="${ref}.html">Detalhes...</a></p>\n \
</div>\n \
<p class="dolor"></p>\n \
<!-- 24062017i -->" $vendas

sed -i "${inserir}d" $vendas
#########