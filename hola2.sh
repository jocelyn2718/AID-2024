
#! /bin/bash

pwd
mkdir nuevo1
cd nuevo1/
touch jossyjoss

# Obtener la fecha actual
fecha=$(date +"%Y-%m-%d")

# Obtener la hora actual
hora=$(date +"%H:%M:%S")

# Imprimir la fecha y la hora
echo "Fecha:$fecha Hora:$hora Mi primera chamba" > jossyjoss
