#!/bin/bash

for pag in $(cat paginas)
do 
#	echo "$pag -"
	salida=$(curl -s -I "$pag" | sed -n '1p' | tail -1 | awk '{print $3 "" $4}' | rev | cut -c3- | rev)

#	echo $salida
	if [ -z "$salida" ]
	then
		echo -e "$pag FAIL\n"
	else
		echo -e "$pag OK\n"
	fi
done | column -s ' ' -t
