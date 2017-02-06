#!/bin/bash

# try

echo "atualizando repo site"
cd ~/dodopontocom.github.io/
git pull
cd -
cd ~/public_html/
git pull
cd -

echo "finish"
#end
