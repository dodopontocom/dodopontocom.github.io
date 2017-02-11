#!/bin/bash


#execute script

./new_imovel.sh > page.html
if [ $? -eq 0 ]; then
	echo "sucesso..."
	else
		echo "something went wrong"
fi