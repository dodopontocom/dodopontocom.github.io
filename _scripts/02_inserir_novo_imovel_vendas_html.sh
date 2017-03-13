#!/bin/bash

#set -xv
#export LANG=pt_BR.UTF-8
#export LANG=pt_BR.ISO_8859-1
#echo $LANG

# touch a.txt
# iconv -f binary -t ISO8859-1 a.txt
# file -bi a.txt
# exit -1

echo "script: $0"

thisscript="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "script: ${thisscript}"
timestamp=$(date -u "+%Y-%d-%m-%H-%MZ")

vendas=$(find ${thisscript}/../refs/ -iname vendas.html)

#validando argumentos
if [[ "$#" -eq 0 || "$#" -gt 1 ]]; then
	echo "precisa de 1 e somente 1 argumento!"
	exit -1
fi
echo "argumento is $1"

count=$(cat ${thisscript}/log/counter.log | tail -1)
#funcao para verificar se há novas pastas de fotos e o arquivo info.
verificar () {
	echo "atualmente temos ${count} pastas dos ímóveis";
	i=$(ls -lrt ${thisscript}/../images/REF*/ | grep images/REF | wc -l);
	if [ ${i} -gt ${count} ]; then
		echo "novas pastas foram adicionadas desde a última visita";
		count=${i} ; echo "número de pastas agora: ${count}";
		echo "${count}" >> ${thisscript}/log/counter.log
	else 
		echo "mais nenhuma pasta foi adicionada até o momento";
	fi
}

verificar

imovel=$1
echo "${imovel}"

#verificar se refXXX ja nao está adicionada em vendas.html
#cat ${vendas} | grep REF${imovel}

########

if [ -d ${thisscript}/../images/REF${imovel}/ ]; then
	echo "pasta encontrada"
else
	echo "a pasta do novo imóvel ainda não existe, cancelando operação..."
	exit -1
fi
if [ -f ${thisscript}/../images/REF${imovel}/info.txt ]; then
	echo "arquivo encontrado"
else
	echo "arquivo info.txt do novo imóvel ainda não existe, cancelando operação..."
	exit -1
fi

###########################
#validando imovel ------- esse egrep faz com que o find retorne nonzero em casa de não encontrar

# echo "procurando se imovel ja nao foi adicionado..."
# find ${thisscript}/../refs/ -name "*${imovel}.html" | egrep '.*'
# if [ "$?" -eq 0 ]; then
# 	echo "imovel referente ja foi adicionado... cancelando operação..."
# 	echo "..."
# 	sleep 2
# 	exit -1
# fi

# else
#	echo "criandos as pastas para a ref${imovel}..."
#	[ -d ${thisscript}/../images/REF${imovel}/ ] || mkdir ${thisscript}/../images/REF${imovel}/ && echo " ... criado"
#fi
########################

info=$(find ${thisscript}/../images/REF${imovel}/ -iname info.txt)
echo "${info}"
ref=$(cat ${info} | grep -a ^ref | cut -d':' -f2)
echo "${ref}"

if [ -z ${ref} ]; then
	echo "arquivo info.txt encontrado, porém incompleto... cancelando operação..."
	exit -1
fi

#atualizando repo
echo "atualizando repositório..."
git pull
if [ "$?" -eq 0 ];then
	echo "repo atualizado com sucesso... continuando"
	echo "..."
	sleep 2
else
	echo "algo deu errado, cancelando..."
	sleep 1
	exit -1
fi
###############################
###########################

#vendas=$(find ${thisscript}/../refs/ -iname vendas.html)
vendasbkp=${timestamp}_vendas_bkp
cp ${vendas} ${thisscript}/log/${vendasbkp}

inserir=$(cat ${vendas} | awk '/24062017i/{print NR}')
#terminar=$(cat $vendas | awk '/24062017t/{print NR}')


find ${thisscript}/../images/REF${imovel}/ -iname info.txt | egrep '.*'
if [ "$?" -eq 0 ]; then
	echo "info.txt encontrado..."
	info=$(find ${thisscript}/../images/REF${imovel}/ -iname info.txt)
	sleep 2
	
else
	echo "info.txt para ref${imovel} ainda não foi criado... cancelando"
	echo "..."
	exit -1
fi

ref=$(cat $info | grep -a ^ref | cut -d':' -f2)
eref=$(cat $info | grep -a ^eref | cut -d':' -f2)
preco=$(cat $info | grep -a ^preco | cut -d':' -f2)
metro=$(cat $info | grep -a ^metro | cut -d':' -f2)
dormi=$(cat $info | grep -a ^dormi | cut -d':' -f2)
banho=$(cat $info | grep -a ^banho | cut -d':' -f2)
titulo=$(cat $info | grep -a ^titulo | cut -d':' -f2)
descri=$(cat $info | grep -a ^descri | cut -d':' -f2)
contato1=$(cat $info | grep -a ^contato1 | cut -d':' -f2)
telefone1=$(cat $info | grep -a ^telefone1 | cut -d':' -f2)
contato2=$(cat $info | grep -a ^contato2 | cut -d':' -f2)
telefone2=$(cat $info | grep -a ^telefone2 | cut -d':' -f2)
financiamento=$(cat $info | grep -a ^financiamento | cut -d':' -f2)
mconstru=$(cat $info | grep -a ^mconstru | cut -d':' -f2)
destaque=$(cat $info | grep -a ^destaque | cut -d':' -f2)
locacao=$(cat $info | grep -a ^locacao | cut -d':' -f2)
captacao=$(cat $info | grep -a ^captacao | cut -d':' -f2)
prop=$(cat $info | grep -a ^prop | cut -d':' -f2)
local=$(cat $info | grep -a ^local | cut -d':' -f2)
imagens=$(cat $info | grep -a ^imagens | cut -d':' -f2)

if [ -z ${locacao} ]; then
	detalheslocacao="valor aluguel: ${locacao}"
else
	detalheslocacao=
fi

refnumber=$(cat $info | grep ^ref | cut -d':' -f2 | grep -o [0-9][0-9][0-9])
outputfile=${thisscript}/log/${timestamp}-${ref}.txt

cat << _EOF_ > ${outputfile}
					<!-- item imovel-->
						<div class="w3l_services_grid">
							<ul>
								<li class="square">${metro} m2</li>
								<li class="bath">${banho}</li>
								<li class="bed">${dormi}</li>
							</ul>
							<div class="hover15 column">
							<div>
							<a href="${ref}.html">
								<figure>
									<img src="../images/REF${refnumber}/1.jpg" alt="" class="img-responsive" />
									<h5 class="cima"><span class="refspan">REF${refnumber}</span></h5>
									<h5 class="local"><span class="refspan">${local}</span></h5>
								</figure>
							</a>
							</div>
							</div>
							<h4><a href="${ref}.html">R$ ${preco}</a></h4>
							<p>${descri}<a class="bake" href="${ref}.html">Detalhes...</a></p>
						</div>
						<p class="dolor"></p>
					<!-- item imovel-->
					<!-- 24062017i -->
_EOF_

#iconv -f latin1 ${outputfile} > ${outputfile}2
#sed -i "/24062017i/r ${outputfile}2" ${vendas}
sed -i "/24062017i/r ${outputfile}" ${vendas}

sed -i "${inserir}d" ${vendas}

#enviando modificações
#	git add --all

#git commit -m "commite timestamp: ${timestamp}"

#git push -u origin shell

#git checkout master

#git merge shell

####
##
#script exit
exit 0
