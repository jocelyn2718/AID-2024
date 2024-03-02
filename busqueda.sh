#!/bin/bash

path="/var/log/"
w="Jocelyn_Alfaro"

cd "$path"
for file in message
do 
#	echo "$file"
#	cat "$file" | grep -i "$w"
	grep -Ril "$w" "$file"

done

