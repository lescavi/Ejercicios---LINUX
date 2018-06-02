#!/bin/bash

clear

while true
	do
		echo "a) Ordenar alfabéticamente de forma inversa por proyecto"
		echo "b) Ordenar alfabéticamente por usuario"
		echo "c) Buscar usuario por teclado y mostrar: user1 Sistemas 123"
       	        echo "d) Salir"
		echo "#Opción: "
	        	read var
		case $var in
		    a)  cat roles.csv | sed 1d | tr ":" " " | sort -k3 -r -n ;;
		    b)  cat roles.csv | sed 1d | tr ":" " " | sort -k2  ;;
		    c)  

		echo "introduce usuario: "
			read user
                        ex=$(grep $user roles.csv)
			if [[ ! -z $ex ]]
				then "Existe usuario $ex"
			else echo "no existe"
			fi
			;;
		d) exit 0;;
	esac
done
