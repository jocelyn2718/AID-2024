#!/bin/bash

path="/var/log/"
w="sh"

cd "$path"
for file in *
do 
#	echo "$file"
#	cat "$file" | grep -i "$w"
	grep -Ril "$w" "$file"

done

