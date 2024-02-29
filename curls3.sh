# Indica que el script debe ejecutarse con el intérprete de bash.
#!/bin/bash
file=paginas.csv

# Este bucle for itera sobre cada línea del archivo "paginas".
# Cada línea debe contener una URL.

echo "Sitio Web,Estado" > $file
for pag in $(cat paginas)
do
        salida=$(curl -s -I "$pag" | sed -n '1p' | tail -1 | awk '{print $3 "" $4}' | rev | cut -c3- | rev)

# Realiza una solicitud a la URL utilizando curl, obtiene el encabezado HTTP con -I,
# extrae la línea correspondiente al estado utilizando sed, tail, y awk, y finalmente
# invierte y corta el resultado para obtener el estado deseado. El resultado se
# almacena en la variable salida.

        if [ -z "$salida" ]
        then
                echo -e "$pag, FAIL" >> $file
        else
                echo -e "$pag, OK" >> $file
        fi

# Se verifica si la variable salida está vacía (lo cual significa que hubo un fallo en
# la solicitud). Dependiendo de la condición, se imprime "FAIL" o "OK" junto con la URL.

done 

column -s, -t $file
