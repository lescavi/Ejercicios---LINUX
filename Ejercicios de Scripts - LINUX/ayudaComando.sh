#!/bin/bash

clear

#Escribir un script que pueda mostrar información de un comando al ejecutar dicho script y pasar como parámetro el comando. 

echo "Escribe el nombre de un comando"
    read comando 
if [[ $(man $comando) ]]
	then                                                
	man $comando     
	else  		
	echo "El comando es incorrecto"

fi


