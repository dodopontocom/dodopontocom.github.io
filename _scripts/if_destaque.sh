#!/bin/bash

destaque=$(cat info.properties | grep destaque | cut -d':' -f2)
if [ -z ${destaque} ]; then
	cat new_imovel.sh | grep ^destaque | sed -i 's/.*destaque/#&/' new_imovel.sh
fi