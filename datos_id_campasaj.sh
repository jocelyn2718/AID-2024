#!/bin/bash

datos_de_zaragoza=$(grep -i "ZARAGOZA" Accidentes_ags_2021.csv)
echo "ID" "COMPASAJ"
echo "$datos_de_zaragoza" | awk -F ',' '{print $1, $16}' | column -s, -t
