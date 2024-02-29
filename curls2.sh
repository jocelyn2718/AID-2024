# Indica que el script debe ejecutarse con el intérprete de bash.
#!/bin/bash

# Imprimen encabezados para las columnas en el formato deseado. 
# "Página" y "Estado" están alineados de manera que coincidan con 
# el formato de las columnas.

echo "--------------------------------------"
echo "|Página                     |Estado  |"
echo "--------------------------------------"

# Este bucle for itera sobre cada línea del archivo "paginas". 
# Cada línea debe contener una URL.

for pag in $(cat paginas)
do
#       echo "$pag -"
        salida=$(curl -s -I "$pag" | sed -n '1p' | tail -1 | awk '{print $3 "" $4}' | rev | cut -c3- | rev)

# Realiza una solicitud a la URL utilizando curl, obtiene el encabezado HTTP con -I, 
# extrae la línea correspondiente al estado utilizando sed, tail, y awk, y finalmente 
# invierte y corta el resultado para obtener el estado deseado. El resultado se 
# almacena en la variable salida.

#       echo $salida
        if [ -z "$salida" ]
        then
                echo -e "|$pag |FAIL |\n"
        else
                echo -e "|$pag |OK   |\n"
        fi

# Se verifica si la variable salida está vacía (lo cual significa que hubo un fallo en 
# la solicitud). Dependiendo de la condición, se imprime "FAIL" o "OK" junto con la URL.

done | column -s ' ' -t

echo "--------------------------------------"

# El done indica el final del bucle. La última línea del script utiliza column -s ' ' -t 
# para formatear la salida en columnas. El argumento -s ' ' especifica que las columnas 
# están separadas por espacios en blanco. -t realiza la formateación de la tabla.

