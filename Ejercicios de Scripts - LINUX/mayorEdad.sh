#!/bin/bash

clear

#Nos pide la edad y nos dice si es mayor de edad o menor.

		echo "Introduzca el año de nacimiento"

hoy=$(date +%d-%m-%Y | cut -d- -f3)

read an
		echo

r=$(( hoy - an ))
		echo
		echo "Tienes $r años."  

if [[ $r -ge 18 ]]
	then
		echo
		echo "Eres mayor de edad"
		echo

	else 
		echo 
		echo "Eres menor de edad."
		echo
fi
