#!/bin/bash

clear

# Realizar un script que, pasando un sólo parámetro por entrada, debe verificar que sólo es un único parámetro, si no, el script sale con error. En caso contrario, si el argumento pasado está conectado 

emite un mensaje de que está contectado, en caso contrario, no lo está


u=$(who | cut -f1 -d" ")

echo "Introduzca el usuario:"

read i

if [[ $i == $u ]]
	then 
		echo "El usuario $i está logado"
	else 
		echo "El usuario $i no existe o no está logado"
fi

#------------------------------------------

#echo "Introduzca el usuario:"

#read user

#$(who | grep $user)

#if [[ $? == 0 ]]
#	then 
#		echo "El usuario está logado"
#	else 
#		echo "El usuario no existe o no está logado"
#fi

#------------------------------------------

#echo "Introduzca el usuario:"

#read user

#if [[ $(who | grep $user) ]]
#	then 
#		echo "El usuario está logado"
#	else 
#		echo "El usuario no existe o no está logado"
#fi


