#!/bin/bash

clear

echo "- Verifica si es fichero, directorio o no se pasa parámetro. 
- Uso: ./script <parámetro>"
echo
if [[ $# != 1 ]]
	then 
		echo "Error en el número de parámetros. Uso programa.sh <argumento>"
		exit 1
elif [[ -f $1 ]]
	then
		echo "$1 es un fichero regular"
		echo
	exit 0;
elif [[ -d $1 ]]
	then
		echo "$1 es un directorio"
		echo
	exit 0;
else 
		echo "¡¡ Error, no es ni fichero ni directorio !!"
		echo
	exit 0;
fi
