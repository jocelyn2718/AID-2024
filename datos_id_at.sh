#!/bin/bash

# Filtrar datos de abastos y mostrar ID y AUTOMOVIL
datos_de_abastos=$(grep -i  "ABASTOS" Accidentes_ags_2021.csv)
echo "$datos_de_abastos" | awk '{print $1, $13}' | column -s, -t 

