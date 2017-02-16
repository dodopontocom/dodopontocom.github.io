#!/bin/bash

vendas=$(find . -iname vendas.html)
inserir=$(cat $vendas | awk '/24062017i/{print NR}')
#terminar=$(cat $vendas | awk '/24062017t/{print NR}')
info=$(find . -iname info.txt)
ref=$(cat $info | grep ref | cut -d':' -f2)
eref=$(cat $info | grep eref | cut -d':' -f2)
preco=$(cat $info | grep preco | cut -d':' -f2)
metro=$(cat $info | grep metro | cut -d':' -f2)

refnumber=$(cat $info | grep ref | cut -d':' -f2 | grep -o [0-9][0-9][0-9])

n=`expr $refnumber % 2`
if [ $n -eq 0 ]; then

#########
sed -i "/24062017i/a \
<div class="col-md-6 about-grid about-one">\n \
<div class="about-grid-right aliquam">\n \
<span class="glyphicon glyphicon glyphicon-home" aria-hidden="true"></span>\n \
</div>\n \
<div class="about-grid-left non">\n \
<!-- -->\n \
<div class="w3l_services_grid">\n \
<div class="hover15 column">\n \
<div>\n \
<a href="ref002.html">\n \
<figure>\n \
<img src="../images/REF002/002.jpg" alt=" " class="img-responsive" />\n \
<h5 class="cima"><span class="refspan">REF002</span></h5>\n \
<h5 class="local"><span class="refspan">Porta do Sol - Mairinque</span></h5>\n \
</figure>\n \
</a>\n \
</div>\n \
</div>\n \
<h4><a href="ref002.html">R$ 790.000,00</a></h4>\n \
<p><a class="bake" href="ref002.html">Detalhes...</a></p>\n \
<ul>\n \
<li class="square">3.000 m²</li>\n \
<li class="bath">4</li>\n \
<li class="bed">4</li>\n \
</ul>\n \
</div>\n \
<!-- -->\n \
</div>\n \
<div class="clearfix"> </div>\n \
</div>\n \
</div>\n \
</div>\n \
<!-- finish other grid -->\n \
<!-- -->\n \
<!-- 24062017i -->" $vendas

sed -i "${inserir}d" $vendas
#########


else

#########
sed -i "/24062017i/a \
<!-- start other grid -->\n \
<div class=\"about-grids\">\n \
<div class=\"col-md-6 about-grid about-one\">\n \
<div class=\"about-grid-left\">\n \
<!-- -->\n \
<div class=\"w3l_services_grid\">\n \
<div class=\"hover15 column\">\n \
<div>\n \
<a href=\"ref009.html\">\n \
<figure>\n \
<img src=\"../images/REF009/001.jpg\" alt=\" \" class=\"img-responsive\" />\n \
<h5 class=\"cima\"><span class=\"refspan\">REF009</span></h5>\n \
<h5 class=\"local\"><span class=\"refspan\">Porta do Sol - Mairinque</span></h5>\n \
</figure>\n \
</a>\n \
</div>\n \
</div>\n \
<h4><a href=\"ref009.html\">R$ 800.000,00</a></h4>\n \
<ul>\n \
<li class=\"square\">2.000 m²</li>\n \
<li class=\"bath\">1</li>\n \
<li class=\"bed\">1</li>\n \
</ul>\n \
</div>\n \
<!-- -->\n \
</div>\n \
<div class=\"about-grid-right\">\n \
<span class=\"glyphicon glyphicon-home\" aria-hidden=\"true\"></span>\n \
</div>\n \
<div class=\"clearfix\"> </div>\n \
<!-- -->\n \
<!-- 24062017i -->" $vendas

sed -i "${inserir}d" $vendas
#########

fi
