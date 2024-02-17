#! /bin/bash

#Crea el archivo
touch horayfecha

# Obtener la fecha actual
fecha=$(date +"%Y-%m-%d")

# Obtener la hora actual
hora=$(date +"%H:%M:%S")

if  [ -f  "horayfecha" ]; then
 echo "Fecha:$fecha Hora:$hora hola - hello - salut" >> horayfecha
else
 touch nuevo
 echo "Fecha:$fecha Hora:$hora ohh no" >> nuevo
fi
 
