#!/bin/bash

clear

#En un fichero tengo una palabra clave. Haz un script que muestre si dicha palabra es el parámetro pasado o no.

echo "Introduce la palabra a buscar:"

read u

r=$(cut -d: -f1 palabrasC.txt | grep $u)

if [[ $? == 0 ]]
        then
		echo
		echo " La palabra $u, se encuentra en el fichero: palabrasC.txt"
		echo

        else
		echo
		echo " $u, no se encuentra en el fichero: palabrasC.txt"
		echo

fi
