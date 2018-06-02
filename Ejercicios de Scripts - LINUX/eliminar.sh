#!/bin/bash

clear

#Escriba un script que elimine un archivo o directorio pasado como parámetro, y le pregunte si está seguro de llevar a cabo la acción.

echo "Escribe el nombre de un archivo o directorio que deseas borrar "
echo "(incluye su ruta absoluta)."
echo "Para salir pulsa ""(Ctrl+c)"""

read nfile

if [[ $? = 0 ]]
then
echo "comprobando............."
    	rm -rfi $nfile

fi


