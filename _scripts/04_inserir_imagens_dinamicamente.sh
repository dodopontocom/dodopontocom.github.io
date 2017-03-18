#!/bin/bash

IFS=$(echo -e "\t\n")

echo "script: $0"

count=1

find . -iname "*.jpg" | while read -r i
do
	
cat << _EOF_ >> test.html
						                <!-- imagem n ${i} -->
						                <div class="item">
						                    <img src="../images/REF${imovel}/${count}.jpg" alt="" />
						                </div>
						                <!-- -->

_EOF_

	count=$((count+1))
	
done



#reset
exit 0