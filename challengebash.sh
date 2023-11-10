#!/bin/bash

# Obtener el último archivo que sigue el patrón "<Patricia>[número]" y ordenarlos numéricamente
last_file=$(ls -1 | grep -E "^<Patricia>[0-9]+$" | sort -n | tail -1)

# Verificar si no se encontraron archivos que coincidan con el patrón
if [ -z "$last_file" ]; then
    # Si no hay archivos, establecer el valor inicial a 0
    last_file=0
else
    # Si hay archivos, extraer el número eliminando "<Patricia>"
    last_file=$(echo "$last_file" | sed "s/<Patricia>//")
fi

# Iterar desde 1 hasta 25 para crear nuevos archivos
for ((i=1; i<=25; i++)); do
    # Calcular el nombre del próximo archivo incrementando el número del último archivo
    next_file=$((last_file+i))
    
    # Crear un nuevo archivo con el nombre "<Patricia>[número]"
    touch "<Patricia>$next_file"
done